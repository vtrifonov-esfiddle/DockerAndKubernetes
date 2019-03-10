# Readme

## Production Build AspNet

Run in powershell from the repository root run:

```
.\Aspnet\Build\build.ps1
```

## Deploy Production Images

Run in powershell from the repository root run:

```
.\Deploy\deploy.ps1
```

To clean up the deployment run in powershell from the repository root run:
```
.\Deploy\cleanup.ps1
```

## Development Build AspNet

1. Open ```AspNet\AspNet.sln``` in Visual Studio.
2. Select **Debug** Configuration
3. Set as startup project **docker-compose** 
4. Start Debugging