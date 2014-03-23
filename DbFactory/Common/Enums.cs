using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DbFactory.Common
{
    public class Enums
    {
        /// <summary>
        /// Type of connection string, either string contains actual connect string or
        /// string containing name of connection string in configuration file
        /// </summary>
        public enum ConnectStringType
        {
            /// <summary>
            /// The string
            /// </summary>
            String = 0,
            /// <summary>
            /// The configuration file
            /// </summary>
            ConfigurationFile = 1
        }

        /// <summary>
        /// Type of client application using access layer, either web application or windows application.
        /// This determines which configuration file to look for connection string.
        /// </summary>
        public enum ApplicationType
        {
            /// <summary>
            /// The web
            /// </summary>
            Web = 0,
            /// <summary>
            /// The windows
            /// </summary>
            Windows = 1,
            /// <summary>
            /// The mobile
            /// </summary>
            Mobile = 2
        }
    }
}
