FROM mcr.microsoft.com/dotnet/core/aspnet AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk AS build
WORKDIR /src
COPY ["aspnetmvc.csproj", "./"]
RUN dotnet restore "./aspnetmvc.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "aspnetmvc.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "aspnetmvc.csproj" -c Release -o /app

FROM base AS final
ENV ASPNETCORE_URLS=http://*:5000
EXPOSE 5000
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "aspnetmvc.dll"]

#Instructions
