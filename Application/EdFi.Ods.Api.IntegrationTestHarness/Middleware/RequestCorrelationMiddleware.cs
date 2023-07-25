// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using System.Threading.Tasks;
using log4net;
using Microsoft.AspNetCore.Http;

namespace EdFi.Ods.Api.IntegrationTestHarness.Middleware;

public class RequestCorrelationMiddleware : IMiddleware
{
    public async Task InvokeAsync(HttpContext context, RequestDelegate next)
    {
        if (context.Request.Query.ContainsKey("reqId"))
        {
            LogicalThreadContext.Properties["reqId"] = context.Request.Query["reqId"].Single();
        }

        await next(context);
    }
}
