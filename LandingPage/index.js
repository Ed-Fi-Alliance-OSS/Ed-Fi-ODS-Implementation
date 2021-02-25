// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

// @ts-check
const newVersion = (suite, major, minor, patch, prerelease) => ({ suite, major, minor, patch, prerelease })

const getVersionString = (v) => `${v.major}.${v.minor}.${v.patch}${v.prerelease != null ? '-' + v.prerelease : ''}`

const getVersionStringForNavigation = (v) => `${v.major}.${v.minor}${(v.suite <= 3 && (v.major <= 3 || (v.major >= 4 && v.minor <= 1))) ? '.' + v.patch : ''}${v.prerelease != null ? '-' + v.prerelease : ''}`

// stops patch versions of 0 from being displayed in previous releases
const getPatchVersion = (v) => ((v.patch === 0 && v.suite <= 3 && v.major <= 3) || (v.major > 3) ? '' : '.' + v.patch)

const getDisplayVersion = (v) => `${v.major}.${v.minor}${getPatchVersion(v)}${v.prerelease != null ? '-prerelease' : ''}`

const nextSuiteVersion = (v) => newVersion(v.suite + 1, 1, 0, 0, null)

const nextMajorVersion = (v) => newVersion(v.suite, v.major + 1, 0, 0, null)

const nextMinorVersion = (v) => newVersion(v.suite, v.major, v.minor + 1, 0, null)

const nextPatchVersion = (v) => newVersion(v.suite, v.major, v.minor, v.patch + 1, null)

const nextPrereleaseVersion = (state) =>
  newVersion(state.version.suite, state.version.major, state.version.minor, state.version.patch, state.config.prerelease || '')

const sortVersions = (vx, vy) => {
  const keys = ['suite', 'major', 'minor', 'patch']

  for (const key of keys) {
    if (vx[key] < vy[key]) {
      return 1
    }
    if (vx[key] > vy[key]) {
      return -1
    }
  }

  return 0
}

const docsUrlFor = (state, isNavigationRoute = false) =>
  state.config.docsUrlTemplate
    .replace('{{version}}', isNavigationRoute ? getVersionStringForNavigation(state.version) : getVersionString(state.version))
    .replace('{{suite}}', state.version.suite.toString())

const apiUrlFor = (state, isNavigationRoute = false) =>
  state.config.apiUrlTemplate
    .replace('{{version}}', isNavigationRoute ? getVersionStringForNavigation(state.version) : getVersionString(state.version))
    .replace('{{suite}}', state.version.suite.toString())

const getDisplayVersionFor = (state) =>
    state.config.displayVersionTemplate
        .replace('{{version}}', getDisplayVersion(state.version))
        .replace('{{suite}}', state.version.suite.toString())

const newTransitions = () => ({
  default: {
    next: 'initial',
    version: (v) => v,
  },
  initial: {
    next: 'patch',
    version: (v) => nextPatchVersion(v),
  },
  patch: {
    next: 'minor',
    version: (v) => nextMinorVersion(v),
  },
  minor: {
    next: 'major',
    version: (v) => nextMajorVersion(v),
  },
  major: {
    next: 'final',
    version: (v) => nextSuiteVersion(v),
  },
  final: {
    next: null,
    version: (v) => {},
  },
})

const newStateMachine = (transitions) => (state) => ({
  ...state,
  now: transitions[state.now].next,
  version: transitions[state.now].version(state.version),
})

const resetState = (state) => ({ ...state, now: 'default' })

const newRequest = (onSuccess, onFail) => async (state) =>
  await fetch(docsUrlFor(state))
    .then((r) => onSuccess(state, r))
    .catch(onFail)

const onSuccess = (state, response) => ({ ...state, response })

const onFail = (err) => showError(err)

const logResponse = (state) => {
  if (state.response.ok != null && state.response.ok) {
    console.log(`🟢 \t${getDisplayVersion(state.version)}`, docsUrlFor(state), state)
  } else {
    console.log(`🔴 \t${getDisplayVersion(state.version)}`, docsUrlFor(state), state)
  }
}

const search = async (state) => {
  const transitions = newTransitions()
  const next = newStateMachine(transitions)

  state = next(state)
  state.versions = []

  const request = newRequest(onSuccess, onFail)

  while (state.now != null) {
    state = await request(state)
    logResponse(state)

    if (state.config.prerelease != null) {
      const version = nextPrereleaseVersion(state)
      let prereleaseState = { ...state, version }

      prereleaseState = await request(prereleaseState)

      logResponse(prereleaseState)
      if (prereleaseState.response.ok) {
        state.versions.push(prereleaseState.version)
      }
    }

    if (state.response.ok) {
      state = next(resetState(state))
      state.versions.push(state.version)
    }

    state = next(state)
  }

  return state
}

const createSections = (state) => {
  state.forEach((s) => {
    if (document.querySelector(`#suite${s.version.suite}`) != null) return

    const template = document.querySelector('#sectionTemplate').innerHTML
    const section = template.replace(/{{apiSuite}}/g, s.version.suite)

    const div = document.createElement('div')
    div.setAttribute('id', `suite${s.version.suite}`)
    div.innerHTML = section

    const sections = document.querySelector('#sections')
    sections.appendChild(div)
  })
}

const createVersionRows = (state) => {
  state.forEach((s) => {
    const template = document.querySelector('#versionTemplate').innerHTML
    const versionRow = template.replace(/{{apiVersion}}/g, getDisplayVersionFor(s))

    const div = document.createElement('div')
    div.innerHTML = versionRow

    const sections = document.querySelector(`#suite${s.version.suite}`).querySelector('div')
    sections.appendChild(div)

    let versionLinks = div.querySelector('.versionLinks')

    if (s.config.apiUrlTemplate != null) {
      const apiTemplate = document.querySelector('#apiTemplate').innerHTML
      versionLinks.innerHTML += apiTemplate.replace(/{{apiUrl}}/g, apiUrlFor(s, true))
    }

    const docsTemplate = document.querySelector('#docsTemplate').innerHTML
    versionLinks.innerHTML += docsTemplate.replace(/{{docsUrl}}/g, docsUrlFor(s, true))
  })
}

const hideProgress = () => {
  const progress = document.querySelector('#progress')
  progress.classList.add('hide')

  const progressDescription = document.querySelector('#progressDescription')
  progressDescription.classList.add('hide')
}

const showSections = () => {
  const sections = document.querySelector('#sections')
  sections.classList.remove('hide')
}

const showError = (err) => {
  hideProgress()
  const errorDescription = document.getElementById('errorDescription')
  errorDescription.innerHTML += `<div>${err}</div>`
  errorDescription.classList.remove('hide')
}

/**
 * @typedef {Object} Config
 * @property {Object} initialVersion - the initial version to use when searching urls
 * @property {string} docsUrlTemplate - the template used when searching for swagger docs page
 * @property {string=} apiUrlTemplate - an optional template to display the api version endpoint
 * @property {string} displayVersionTemplate - the template used to display a human readable representation of the version
 * @property {string=} prerelease - an optional prerelease tag to look for in url route
 *
 * @description
 * Running Locally:
 *    Disable CORS in Chrome: Win + R -> chrome.exe --user-data-dir="C://chromeDev" --disable-web-security
 *    Open LandingPage/index.html in browser with CORS disabled
 *    Update apiUrlBaseForLocalTesting variable below if needed
 */
const getConfigs = () => {
  const apiUrlBaseForLocalTesting = 'https://api-stage.ed-fi.org'
  const apiUrlBase =
    window.location.protocol === 'file:' ? apiUrlBaseForLocalTesting : `${window.location.protocol}//${window.location.host}`

  const configs = [
    {
      initialVersion: newVersion(2, 2, 4, 0, null),
      docsUrlTemplate: `${apiUrlBase}/v{{version}}/docs/`,
      displayVersionTemplate: `Ed-Fi ODS / API Suite {{suite}} v{{version}}`
    },
    {
      initialVersion: newVersion(3, 3, 1, 0, null),
      docsUrlTemplate: `${apiUrlBase}/v{{version}}/docs/`,
      apiUrlTemplate: `${apiUrlBase}/v{{version}}/api/`,
      displayVersionTemplate: `Ed-Fi ODS / API Suite {{suite}} v{{version}}`
    },
    {
      initialVersion: newVersion(3, 5, 0, 0, null),
      docsUrlTemplate: `${apiUrlBase}/v{{version}}/docs/`,
      apiUrlTemplate: `${apiUrlBase}/v{{version}}/api/`,
      displayVersionTemplate: `Ed-Fi ODS / API Suite {{suite}} v{{version}}`
    },
    {
      initialVersion: newVersion(3, 5, 0, 0, null),
      docsUrlTemplate: `${apiUrlBase}/SharedInstance_v{{version}}/docs/`,
      apiUrlTemplate: `${apiUrlBase}/SharedInstance_v{{version}}/api/`,
      displayVersionTemplate: `Ed-Fi ODS / API Suite {{suite}} v{{version}} - Shared Instance`
    },
    {
      initialVersion: newVersion(3, 5, 0, 0, null),
      docsUrlTemplate: `${apiUrlBase}/YearSpecific_v{{version}}/docs/`,
      apiUrlTemplate: `${apiUrlBase}/YearSpecific_v{{version}}/api/`,
      displayVersionTemplate: `Ed-Fi ODS / API Suite {{suite}} v{{version}} - Year Specific`
    }
  ]

  return configs
}

const init = (configs = getConfigs()) => {
  console.time('✔️')
  configs.forEach((c) => console.log(c))

  const searches = configs.map((config) => {
    const state = { config, now: 'default', version: config.initialVersion }

    return new Promise((resolve, reject) => {
      resolve(search(state))
      reject(showError)
    })
  })

  Promise.all(searches).then((states) => {
    states.forEach((s) => console.log(s))

    // @ts-ignore Property 'flat' does not exist on type 'any[]'. ts(2339)
    const state = states.map((s) => s.versions.map((v) => ({ version: v, config: s.config }))).flat()
    state.sort((x, y) => sortVersions(x.version, y.version))
    console.log(state)

    createSections(state)
    createVersionRows(state)

    hideProgress()
    showSections()

    console.timeEnd('✔️')
  })
}

init();
