{
  Webserver template for serving static files
  Copyright 2020 - Marcus Fernstrom
  License - Apache 2.0
  GitHub - https://github.com/MFernstrom/static-file-webserver
  Mimefile is licensed Apache 2.0 and was sourced from http://svn.apache.org/viewvc/httpd/httpd/trunk/docs/conf/mime.types?view=markup
}
program StaticServer;

uses
  SysUtils, fphttpapp, fpwebfile;
const
  port = 8080;

begin
  RegisterFileLocation('app', 'public_html');
  MimeTypesFile := extractfiledir(paramstr(0)) +  PathDelim + 'mime.types';
  Application.Initialize;
  Application.Port := port;
  WriteLn(format('Static HTTP server starting on localhost:%d', [port]));
  Application.Run;
end.