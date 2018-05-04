Configuration JJWebsite {

    # Import the module that contains the resources we're using.
    Import-DscResource -ModuleName PsDesiredStateConfiguration

    Node 'localhost' {
       WindowsFeature JJWebServerRole
       {
          Ensure = "Present" 
          Name   = "Web-Server"  
       }

       File JJWebServerFileHomepage
       {
          DestinationPath = 'C:\inetpub\wwwroot\default.htm'
          Ensure = "Present"
          Contents = '<html><body><h1>Hello JJ app !</h1></body></html>'
          DependsOn = "[WindowsFeature]JJWebServerRole"        
       }

       File JJWebServerFileDemo {
          DestinationPath = 'C:\Temp\hello.txt'
          Ensure = "Present"
          Contents = 'Hello JJ !'
       }
    }
}

JJWebsite