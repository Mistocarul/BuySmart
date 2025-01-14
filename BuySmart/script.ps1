# Define variables for project key, SonarQube URL, and token
$projectKey = "BuySmart"
$sonarUrl = "http://localhost:9000"
$sonarToken = "sqp_3583c29c398cd0a771fc452e93c2dc7dea515bc9"
$coverageReportPath = "coverage.xml"

# Define files/directories to exclude from coverage
$exclusions = "**/DTOs/**,**/Migrations/**,**/*.Designer.cs, **/*DbContext.cs, **/Properties/**, **/bin/**, **/obj/**, **/Configurations/**, **/Commands/**, **/Queries/**, **/*Injection.cs, **/*Validator.cs, **/*Command.cs, **/*Options.cs, **/*Generator.cs, **/*Repository.cs"


# Begin SonarScanner analysis with exclusions
dotnet sonarscanner begin `
    /k:"$projectKey" `
    /d:sonar.host.url="$sonarUrl" `
    /d:sonar.login="$sonarToken" `
    /d:sonar.cs.vscoveragexml.reportsPaths="$coverageReportPath" `
    /d:sonar.coverage.exclusions="$exclusions"

# Build the project without incremental compilation
dotnet build --no-incremental

# Collect coverage report
dotnet-coverage collect "dotnet test" -f xml -o "$coverageReportPath"

# End SonarScanner analysis
dotnet sonarscanner end /d:sonar.login="$sonarToken"
