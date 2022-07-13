// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

namespace EdFi.Ods.SandboxAdmin.Models.Results
{
    public class ConfirmationResult : AdminActionResult<ConfirmationResult, PasswordResetModel>
    {
        public static ConfirmationResult UserAlreadyConfirmed { get; set; } = new ConfirmationResult
        {
            Success = false,
            Message = "This account has already been confirmed.  Would you like to reset your password?"
        };

        public static ConfirmationResult Failure { get; set; } = new ConfirmationResult
        {
            Success = false,
            Message = "Your confirmation request is invalid or expired."
        };

        public string PasswordResetToken { get; private set; }

        public string UserName { get; set; }

        public static ConfirmationResult Successful(string userName, string passwordResetToken)
        {
            return new ConfirmationResult
            {
                Success = true,
                UserName = userName,
                PasswordResetToken = passwordResetToken
            };
        }
    }
}
