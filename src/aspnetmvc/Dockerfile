FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 5000

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["aspnetmvc.csproj", "./"]
RUN dotnet restore "aspnetmvc.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "aspnetmvc.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "aspnetmvc.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "aspnetmvc.dll"]
