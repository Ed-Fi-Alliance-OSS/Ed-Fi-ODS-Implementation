//  SPDX-License-Identifier: Apache-2.0
//  Licensed to the Ed-Fi Alliance under one or more agreements.
//  The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
//  See the LICENSE and NOTICES files in the project root for more information.

// configuration for each section. description and links data is populated later from the metadata url
var sections = {
  Resources: { color: '', description: [], links: [] },
  Composites: { color: '', description: [], links: [] },
  Other: { color: '', description: [], links: [] },
  Profiles: { color: '', description: [], links: [] },
}
sections.Resources.color = 'blue-text'
sections.Composites.color = 'green-text'
sections.Other.color = 'orange-text'
sections.Profiles.color = 'red-text'
sections.Resources.description = [
  'Resources are the primary entities that most API client applications work with on a regular basis. Students, staff, education organizations, and their related entities are maintained using this area of the API',
]
sections.Composites.description = [
  'Composites are read-only combinations of resources that address specific business use cases. Using composites reduces the number of calls that an API client application must make to retrieve resources for these use cases.',
  'For example, the Enrollment composite can return all the students in a given class section or all students associated with a particular staff member, and similar student association-related information in a single call. Platform hosts may add their own composite resources.',
]
sections.Other.description = [
  'The other area of the API contains functional resources. These resources may be enabled or disabled by the ODS / API platform host.',
  'The identity management API is used to access a native identity system if one exists in the enterprise. The endpoints provide client applications with the ability to find and (optionally) create unique person identifiers that can be used with Student, Staff, and Parent resources.',
]
sections.Profiles.description = [
  'Profiles are used by platform hosts to restrict access to properties of a resource. Resource properties may be read-write, read-only, or unavailable. When API client applications use a profile to access resources, they are limited to a subset of the properties available on the underlying resource.',
]

function hideProgress() {
  var progress = document.getElementById('progress')
  progress.classList.add('hide')

  var progressDescription = document.getElementById('progressDescription')
  progressDescription.classList.add('hide')
}

function showVersion(json) {
  var version = document.getElementById('version')
  version.textContent = 'v' + json.informationalVersion
  version.className = version.className.replace('hide', '') // IE11 support
  version.classList.remove('hide')

  return json
}

function showPageDescription() {
  var pageDescription = document.getElementById('pageDescription')
  pageDescription.className = pageDescription.className.replace('hide', '') // IE11 support
  pageDescription.classList.remove('hide')
}

function showError(message) {
  var errorDescription = document.getElementById('errorDescription')
  errorDescription.innerHTML += '<p>' + message + '</p>'
  errorDescription.className = errorDescription.className.replace('hide', '') // IE11 support
  errorDescription.classList.remove('hide')
}

// maps the json data from the metadata url to the sections variable
function mapSections(json) {
  json.forEach(function (data) {
    var prefix = data.prefix === '' ? 'Resources' : data.prefix
    if (sections[prefix] == null) sections[prefix] = { color: '', description: '', links: [] }

    var link = { name: data.name, uri: data.endpointUri }
    sections[prefix].links.push(link)
  })
  console.log('sections', sections)
}

function onChangeSchoolYear() {
    var yearSelected = $("#schoolYearSelect option:selected").text();

    $(".url-link").each(function() {
        var oldUrl = $(this).attr("href");
        var newUrl = oldUrl.replace(/20\d{2}/g, yearSelected);
        $(this).attr("href", newUrl);
    });
}

function createSectionLinks(sectionName, hasYear) {
  var section = sections[sectionName]
  var prefix = sectionName === 'Resources' ? '' : sectionName + ': '
  return section.links
    .map(function (link) {
        routePrefix = appSettings.RoutePrefix ? appSettings.RoutePrefix + '/' : ''

        if (hasYear) {
            var year = $("#schoolYearSelect option:selected").text();
            return `<li><a class="url-link" href="./${routePrefix}index.html?urls.primaryName=${prefix}${link.name}&year=${year}">${link.name}</a ></li>`
        } else {
            return `<li><a class="url-link" href="./${routePrefix}index.html?urls.primaryName=${prefix}${link.name}">${link.name}</a ></li>`
        }
    })
    .join('')
}

function addYearOptions(){
    var year = new Date().getFullYear()
    for (let i = year - 1; i <= year + 1; i++) {
        $('#schoolYearSelect').append(new Option(i, i))
    }

    $("#schoolYearSelect option[value='" + year + "']").attr("selected", "selected");
}

// dynamically creates the api sections using the #sectionTemplate
function createSections() {
    var uri = sections['Resources'].links[0].uri;
    var hasYear = /\/(20)\d{2}/.test(uri);

    if (hasYear) {
        addYearOptions();
        $("#schoolYear").show();
    }

    Object.keys(sections).forEach(function (sectionName) {
    var section = sections[sectionName]
    if (section.links <= 0) return

    var sectionTemplate = document.getElementById('sectionTemplate')
    var templateHtml = sectionTemplate.innerHTML
    var html = templateHtml
      .replace(/{{sectionColor}}/g, section.color)
      .replace(/{{sectionName}}/g, sectionName)
      .replace(
        /{{sectionDescription}}/g,
        section.description
          .map(function (p) {
            return '<p>' + p + '</p>'
          })
          .join('')
      )
        .replace(/{{sectionLink}}/g, createSectionLinks(sectionName, hasYear))

    section.links.forEach(function(link) {
        console.log("Found: " + link.uri);
    });

    var element = document.createElement('div')
    element.setAttribute('class', 'hide')
    element.innerHTML = html

    var pageTitle = document.getElementById('pageTitle')
    pageTitle.parentNode.appendChild(element)

    element.classList.remove('hide')
    element.className = element.className.replace('hide', '') // IE11 support
    })
}

const logJSON = (json) => {
  console.log(json)
  return json
}

const getJSON = (response) => response.json()

let appSettings = {}

const fetchAppSettings = (route = 'appSettings.json') =>
  fetch(route)
    .then(getJSON)
    .then(logJSON)
    .then((json) => {
      appSettings = json
      return json
    })

const fetchWebApiVersionUrl = (appSettings) => {
  const { WebApiVersionUrl } = appSettings

  return fetch(WebApiVersionUrl)
    .then(getJSON)
    .then(logJSON)
    .catch(function (ex) {
      showError(`Failed to retrieve version from ${WebApiVersionUrl}`)
      hideProgress()
    })
}

const fetchOpenApiMetadata = (webApiVersionUrlJson) => {
  const { openApiMetadata } = webApiVersionUrlJson.urls

  return fetch(openApiMetadata)
    .then(getJSON)
    .then(logJSON)
    .catch(function (ex) {
      showError(`Failed to retrieve resources from ${openApiMetadata}`)
      hideProgress()
    })
}

fetchAppSettings()
  .then(fetchWebApiVersionUrl)
  .then(showVersion)
  .then(fetchOpenApiMetadata)
  .then(mapSections)
  .then(showPageDescription)
  .then(createSections)
  // extra .then() because Edge has no .finally() support
  .then(hideProgress)
  .finally(hideProgress)
