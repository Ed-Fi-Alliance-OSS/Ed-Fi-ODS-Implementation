// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using EdFi.Ods.SandboxAdmin.Extensions;

namespace EdFi.Ods.SandboxAdmin.Models.Results
{
    public abstract class AdminActionResult<TResult, TModel> : IAdminActionResult
        where TResult : AdminActionResult<TResult, TModel>
    {
        private readonly HashSet<string> _failingFields = new HashSet<string>();

        public string RedirectRoute { get; set; }

        public bool HasMessage
        {
            get { return !string.IsNullOrEmpty(Message); }
        }

        // SF: I agree with this recommendation from SonarSource. However, I am nervous
        // that this isn't being falgged as unused, yet changing to a method isn't
        // breaking anything. Would need to test this thoroughly. Might prefer to
        // make an exception and leave this alone. For more information, see 
        // https://rules.sonarsource.com/csharp/RSPEC-2365
        public string[] GetFailingFields() => _failingFields.ToArray();

        public bool Success { get; set; }

        public string Message { get; set; }

        public TResult WithMessage(string message)
        {
            Message = message;
            return (TResult) this;
        }

        public TResult AddFailingField<T>(Expression<Func<TModel, T>> field)
        {
            _failingFields.Add(
                field.MemberName()
                     .ToLower());

            return (TResult) this;
        }
    }
}
