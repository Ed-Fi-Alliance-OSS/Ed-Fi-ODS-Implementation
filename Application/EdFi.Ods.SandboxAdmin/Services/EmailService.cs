﻿// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Microsoft.Extensions.Configuration;
using System;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace EdFi.Ods.SandboxAdmin.Services
{
    public class EmailService : IEmailService
    {
        private readonly IRouteService _routeService;
        private readonly IConfiguration _configuration;

        public EmailService(IRouteService routeService, IConfiguration configuration)
        {
            _routeService = routeService;
            _configuration = configuration;
        }

        public void SendConfirmationEmail(string emailAddress, string secret)
        {
            var messageBuilder = new StringBuilder();

            messageBuilder.AppendLine(
                @"An account has been created for email address '" + emailAddress +
                "' in Sandbox Admin.");

            messageBuilder.AppendLine();
            messageBuilder.AppendLine(@"Please follow this link to set your password:");
            messageBuilder.AppendLine();
            messageBuilder.AppendLine(_routeService.GetRouteForActivation(emailAddress, secret));

            var body = string.Format(messageBuilder.ToString(), secret);

            var message = new MailMessage
            {
                Subject = "Sandbox Account Activation",
                Body = body
            };

            message.To.Add(new MailAddress(emailAddress));

            GetSmtpClientWithEnvironmentVariableExpansion()
               .Send(message);
        }

        public void SendForgotPasswordEmail(string emailAddress, string secret)
        {
            var messageBuilder = new StringBuilder();
            messageBuilder.AppendLine(@"You have requested a password reset for your account in Sandbox Admin.");
            messageBuilder.AppendLine();
            messageBuilder.AppendLine(@"In order to reset your password, please follow this link:");
            messageBuilder.AppendLine(_routeService.GetRouteForPasswordReset(emailAddress, secret));

            var body = string.Format(messageBuilder.ToString(), secret);

            var message = new MailMessage
            {
                Subject = "Sandbox Account Password Reset",
                Body = body
            };

            message.To.Add(new MailAddress(emailAddress));

            GetSmtpClientWithEnvironmentVariableExpansion()
               .Send(message);
        }

        private SmtpClient GetSmtpClientWithEnvironmentVariableExpansion()
        {
            var smtpClient = new SmtpClient();
            var smtpUsername = _configuration.GetSection("smtp:Username").Value;
            var smtpPassword = _configuration.GetSection("smtp:Password").Value;

            if (smtpUsername != null && smtpPassword != null)
            {
                smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
            }

            // Expand any embedded environment variables
            if (smtpClient.PickupDirectoryLocation != null)
            {
                smtpClient.PickupDirectoryLocation = Environment.ExpandEnvironmentVariables(smtpClient.PickupDirectoryLocation);

                // Try to make sure that the specified email directory exists
                try
                {
                    Directory.CreateDirectory(smtpClient.PickupDirectoryLocation);
                }
                catch { }
            }

            return smtpClient;
        }
    }
}