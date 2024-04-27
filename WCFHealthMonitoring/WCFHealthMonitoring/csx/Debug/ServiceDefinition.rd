<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="WCFHealthMonitoring" generation="1" functional="0" release="0" Id="9a52818c-a02b-4f52-b15b-a30a0fc379e4" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="WCFHealthMonitoringGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="JobWorker:InputRequest" protocol="tcp">
          <inToChannel>
            <lBChannelMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/LB:JobWorker:InputRequest" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="JobWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/MapJobWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="JobWorkerInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/MapJobWorkerInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:JobWorker:InputRequest">
          <toPorts>
            <inPortMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/JobWorker/InputRequest" />
          </toPorts>
        </lBChannel>
        <sFSwitchChannel name="SW:JobWorker:InternalRequest">
          <toPorts>
            <inPortMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/JobWorker/InternalRequest" />
          </toPorts>
        </sFSwitchChannel>
      </channels>
      <maps>
        <map name="MapJobWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/JobWorker/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapJobWorkerInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/JobWorkerInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="JobWorker" generation="1" functional="0" release="0" software="C:\Users\stame\source\repos\RCAvezbe\WCFHealthMonitoring\WCFHealthMonitoring\csx\Debug\roles\JobWorker" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="InputRequest" protocol="tcp" portRanges="10100" />
              <inPort name="InternalRequest" protocol="tcp" />
              <outPort name="JobWorker:InternalRequest" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/SW:JobWorker:InternalRequest" />
                </outToChannel>
              </outPort>
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;JobWorker&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;JobWorker&quot;&gt;&lt;e name=&quot;InputRequest&quot; /&gt;&lt;e name=&quot;InternalRequest&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/JobWorkerInstances" />
            <sCSPolicyUpdateDomainMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/JobWorkerUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/JobWorkerFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="JobWorkerUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="JobWorkerFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="JobWorkerInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="622c61c8-2511-4326-b1e7-f1b604217a4a" ref="Microsoft.RedDog.Contract\ServiceContract\WCFHealthMonitoringContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="3cabac4d-06cb-444d-a3ec-f1475dcddff9" ref="Microsoft.RedDog.Contract\Interface\JobWorker:InputRequest@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/WCFHealthMonitoring/WCFHealthMonitoringGroup/JobWorker:InputRequest" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>