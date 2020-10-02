// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Microsoft.Extensions.Configuration;
using System;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using EdFi.Common.Extensions;
using EdFi.Ods.Common.Extensions;

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
            message.From = GetFromAddress();

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
            message.From = GetFromAddress();

            GetSmtpClientWithEnvironmentVariableExpansion()
                .Send(message);
        }

        private SmtpClient GetSmtpClientWithEnvironmentVariableExpansion()
        {
            var smtpUsername = _configuration.GetValue<string>("MailSettings:Smtp:Username");
            var smtpPassword = _configuration.GetValue<string>("MailSettings:Smtp:Password");
            var host = _configuration.GetValue<string>("MailSettings:Smtp:Host");
            var port = _configuration.GetValue<int>("MailSettings:Smtp:Port");
            var pickupDirectoryLocation = _configuration.GetValue<string>("MailSettings:Smtp:SpecifiedPickupDirectory:PickupDirectoryLocation");

            var smtpClient = new SmtpClient();

            if (smtpUsername != null && smtpPassword != null)
            {
                smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
            }

            if (!string.IsNullOrEmpty(host))
            {
                smtpClient.Host = host;
            }

            if (!port.IsDefaultValue())
            {
                smtpClient.Port = port;
            }

            if (Enum.TryParse(
                typeof(SmtpDeliveryMethod), _configuration.GetValue<string>("MailSettings:Smtp:DeliveryMethod"), true,
                out object deliveryMethod))
            {
                smtpClient.DeliveryMethod = (SmtpDeliveryMethod) deliveryMethod;
            }

            if (!string.IsNullOrEmpty(pickupDirectoryLocation))
            {
                // Expand any embedded environment variables
                smtpClient.PickupDirectoryLocation = Environment.ExpandEnvironmentVariables(pickupDirectoryLocation);

                // Try to make sure that the specified email directory exists
                try
                {
                    Directory.CreateDirectory(smtpClient.PickupDirectoryLocation);
                }
                catch { }
            }

            return smtpClient;
        }

        private MailAddress GetFromAddress()
        {
            return new MailAddress(_configuration.GetValue<string>("MailSettings:Smtp:From"));
        }
    }
}