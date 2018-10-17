using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QLVS.Startup))]
namespace QLVS
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
