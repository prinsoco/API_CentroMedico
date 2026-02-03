using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class RouteInfo
    {
        public int? menuid { get; set; }
        public string? path { get; set; }
        public string? title { get; set; }
        public string? type { get; set; }
        public string? collapse { get; set; }
        public string? icontype { get; set; }
        public List<ChildrenItems>? children { get; set; }

        public RouteInfo()
        {
            children = new List<ChildrenItems>();
        }
    }

    public class ChildrenItems
    {
        public int? menuid { get; set; }
        public int? submenuid { get; set; }
        public string? path { get; set; }
        public string? title { get; set; }
        public string? ab { get; set; }
        public string? type { get; set; }
    }
}
