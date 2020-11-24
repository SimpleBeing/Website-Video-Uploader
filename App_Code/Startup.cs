using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(StudentSupport.Startup))]
namespace StudentSupport
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
