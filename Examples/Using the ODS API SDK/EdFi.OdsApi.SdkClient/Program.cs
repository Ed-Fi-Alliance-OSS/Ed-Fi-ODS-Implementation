// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using CommandLine;
using EdFi.OdsApi.Sdk.Apis.All;
using EdFi.OdsApi.Sdk.Client;
using EdFi.OdsApi.Sdk.Models.All;
using EdFi.OdsApi.SdkClient;
using EdFi.OdsApi.SdkClient.EdFiTools.Authentication;
using EdFi.OdsApi.SdkClient.EdFiTools.Serialization;
using Microsoft.Extensions.Logging;

// Parse the command line arguments
var options = Parser.Default.ParseArguments<Options>(args)
    .WithNotParsed(e => e.Output()) // Show errors and help
    .Value;

if (options == default) return;

var httpClient = new HttpClient(new HttpClientHandler
{
    // Trust all SSL certs -- needed unless signed SSL certificates are configured.
    ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator
})
{
    BaseAddress = new Uri($"{options.OdsApiUrl}/data/v3")
};

var tokenRetriever = new TokenRetriever(options.OdsApiUrl, options.ClientKey, options.ClientSecret);
var tokenProvider = new EdFiTokenProvider(() => tokenRetriever.ObtainNewBearerToken());
var loggerFactory = LoggerFactory.Create(builder => builder.AddConsole());
var logger = loggerFactory.CreateLogger<StudentsApi>();
var apiEvents = new StudentsApiEvents();
var jsonSerializerOptionsProvider = new JsonSerializerOptionsProvider(EdFiJsonOptions.Create());

var studentsApi = new StudentsApi(
    logger,
    loggerFactory,
    httpClient,
    jsonSerializerOptionsProvider,
    apiEvents,
    tokenProvider
);

var studentResponse = await studentsApi.GetStudentsAsync(limit: 1, offset: 0, totalCount: true);

Console.WriteLine("Response code is " + studentResponse.StatusCode);

// Parse the total count value out of the "Total-Count" response header
var totalCount = int.Parse(studentResponse.Headers.First(h => h.Key.Equals("total-count", StringComparison.OrdinalIgnoreCase)).Value.First());

int offset = 0;
int limit = 100;
var students = new List<EdFiStudent>();

while (offset < totalCount)
{
    Console.WriteLine($"Fetching student records {offset} through {Math.Min(offset + limit, totalCount)} of {totalCount}");
    var resp = await studentsApi.GetStudentsAsync(limit: limit, offset: offset);

    if (!resp.IsOk)
    {
        Console.WriteLine($"Request failed at offset {offset}. Status: {resp.StatusCode}");
        break; // stop paging
    }

    var list = resp.Ok();
    students.AddRange(list);

    offset += limit;
}

Console.WriteLine();
Console.WriteLine("Student Results");

foreach (var student in students)
{
    Console.WriteLine($"Student: {student.StudentUniqueId}, {student.FirstName}, {student.LastSurname}");
}

Console.WriteLine();
Console.WriteLine("Hit ENTER key to continue...");
Console.ReadLine();