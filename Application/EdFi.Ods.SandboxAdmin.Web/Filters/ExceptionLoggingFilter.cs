// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System.Web.Mvc;
using log4net;

namespace EdFi.Ods.SandboxAdmin.Web.Filters
{
    public class ExceptionLoggingFilter : IExceptionFilter
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(ExceptionLoggingFilter));

        public void OnException(ExceptionContext filterContext)
        {
            _logger.Error(filterContext.Exception);
        }
    }
}
