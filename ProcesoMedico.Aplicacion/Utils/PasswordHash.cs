using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Utils
{
    public class PasswordHasher : IPasswordHasher
    {
        public string HashPassword(string password)
        {
            using (SHA256 mySHA256 = SHA256Managed.Create())
            {
                byte[] hash = mySHA256.ComputeHash(Encoding.UTF8.GetBytes(password.ToString()));

                StringBuilder hashSB = new StringBuilder();
                for (int i = 0; i < hash.Length; i++)
                {
                    hashSB.Append(hash[i].ToString("x2"));
                }
                return hashSB.ToString();
            }
        }


        public PasswordVerificationResult VerifyHashedPassword(
          string hashedPassword, string providedPassword)
        {
            if (hashedPassword == HashPassword(providedPassword))
                return PasswordVerificationResult.Success;
            else
                return PasswordVerificationResult.Failed;
        }
    }
}
