{
  Webserver template for serving static files
  Copyright 2020 - Marcus Fernstrom
  License - Apache 2.0
  GitHub - https://github.com/MFernstrom/static-file-webserver
  Mimefile is licensed Apache 2.0 and was sourced from http://svn.apache.org/viewvc/httpd/httpd/trunk/docs/conf/mime.types?view=markup
}
program StaticServer;

uses
  SysUtils,
  fphttpapp,
  httproute,
  HTTPDefs,
  fpwebfile;

const
  port = 8080;
  fileLocation = 'app';

  procedure rerouteRoot(aRequest: TRequest; aResponse: TResponse);
  begin
    aResponse.Code := 301;
    aResponse.SetCustomHeader('Location', fileLocation + '/index.html');
    aResponse.SendContent;
  end;

begin
  Application.Initialize;
  RegisterFileLocation(fileLocation, 'public_html');
  HTTPRouter.RegisterRoute('/', @rerouteRoot);
  MimeTypesFile := ExtractFilePath(ParamStr(0)) + 'mime.types';
  Application.Port := port;
  WriteLn(format('Static HTTP server starting on localhost:%d', [port]));
  Application.Run;
end.
