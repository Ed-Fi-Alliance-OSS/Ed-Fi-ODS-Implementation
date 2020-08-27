// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.SwaggerUI;

namespace EdFi.Ods.SwaggerUI
{
    public class EdFiSwaggerMiddleware : IMiddleware
    {
        private readonly IWebHostEnvironment _hostingEnv;
        private readonly ILoggerFactory _loggerFactory;
        private readonly SwaggerUIOptions _options;

        public EdFiSwaggerMiddleware(
            IWebHostEnvironment hostingEnv,
            ILoggerFactory loggerFactory,
            IOptionsSnapshot<SwaggerUIOptions> options)
        {
            _hostingEnv = hostingEnv;
            _loggerFactory = loggerFactory;
            _options = options.Value;
        }

        public async Task InvokeAsync(HttpContext context, RequestDelegate next)
        {
            var middleware = new SwaggerUIMiddleware(next, _hostingEnv, _loggerFactory, _options);
            await middleware.Invoke(context);
        }
    }

    public static class EdFiSwaggerExtensions
    {
        public static IApplicationBuilder UseEdFiSwaggerUI(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<EdFiSwaggerMiddleware>();
        }
    }
}
