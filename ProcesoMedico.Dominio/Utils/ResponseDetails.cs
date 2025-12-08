using Newtonsoft.Json;

namespace ProcesoMedico.Dominio.Utils
{
    public class ResponseDetails<T>
    {
        public ResponseDetails(T data)
        {
            this.Data = data;
        }

        public ResponseDetails(T data, T dataRequest)
        {
            this.Data = data;
            this.DataRequest = dataRequest;
        }


        public ResponseDetails(int codeStatus, string? inforMessage = null, string? uiMessage = null, dynamic? exceptionDetail = null)
        {
            Code = codeStatus;
            Data = exceptionDetail == null ? Data : exceptionDetail;

            switch (Code)
            {
                case 200:
                    break;
                case 400:
                    Info = string.IsNullOrEmpty(inforMessage) ? "BadRequest" : inforMessage;
                    Message = string.IsNullOrEmpty(uiMessage) ? "Error al procesar la solicitud" : uiMessage;
                    break;
                case 401:
                    Info = string.IsNullOrEmpty(inforMessage) ? "Unauthorized" : inforMessage;
                    Message = string.IsNullOrEmpty(uiMessage) ? "Invalid Token" : uiMessage;
                    break;
                case 404:
                    Info = string.IsNullOrEmpty(inforMessage) ? "NotFound" : inforMessage;
                    Message = string.IsNullOrEmpty(uiMessage) ? "Registro no encontrado" : uiMessage;
                    break;
                case 500:
                    Info = string.IsNullOrEmpty(inforMessage) ? "InternalServerError" : inforMessage;
                    Message = string.IsNullOrEmpty(uiMessage) ? "Error interno del servidor" : uiMessage;
                    break;
                default:
                    Info = string.IsNullOrEmpty(inforMessage) ? "Other" : inforMessage;
                    Message = string.IsNullOrEmpty(uiMessage) ? "Otro" : uiMessage;
                    break;

            }

        }

        public int Code { get; set; } = 200;
        public string? Info { get; set; } = "OK";
        public string? Message { get; set; } = "Success";
        public string? Url { get; set; } = "";
        public string? Headers { get; set; } = "";
        public T? Data { get; set; }

        public T? DataRequest { get; set; }
        public override string? ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}
