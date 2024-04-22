﻿<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="InterroleCommunication" generation="1" functional="0" release="0" Id="5dbc193e-bc1d-4fff-bf79-2b8c04e1ca5a" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="InterroleCommunicationGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="JobWorker:InputRequest" protocol="tcp">
          <inToChannel>
            <lBChannelMoniker name="/InterroleCommunication/InterroleCommunicationGroup/LB:JobWorker:InputRequest" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="JobWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/InterroleCommunication/InterroleCommunicationGroup/MapJobWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="JobWorkerInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/InterroleCommunication/InterroleCommunicationGroup/MapJobWorkerInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:JobWorker:InputRequest">
          <toPorts>
            <inPortMoniker name="/InterroleCommunication/InterroleCommunicationGroup/JobWorker/InputRequest" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapJobWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/InterroleCommunication/InterroleCommunicationGroup/JobWorker/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapJobWorkerInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/InterroleCommunication/InterroleCommunicationGroup/JobWorkerInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="JobWorker" generation="1" functional="0" release="0" software="C:\Users\stame\source\repos\RCAvezbe\InterroleCommunication\InterroleCommunication\csx\Debug\roles\JobWorker" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="InputRequest" protocol="tcp" portRanges="10100" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;JobWorker&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;JobWorker&quot;&gt;&lt;e name=&quot;InputRequest&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/InterroleCommunication/InterroleCommunicationGroup/JobWorkerInstances" />
            <sCSPolicyUpdateDomainMoniker name="/InterroleCommunication/InterroleCommunicationGroup/JobWorkerUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/InterroleCommunication/InterroleCommunicationGroup/JobWorkerFaultDomains" />
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
    <implementation Id="2acaf862-18ed-4dd8-8c69-b61b1f74d53f" ref="Microsoft.RedDog.Contract\ServiceContract\InterroleCommunicationContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="4a03fea4-ddec-4b83-8ba3-83775c283420" ref="Microsoft.RedDog.Contract\Interface\JobWorker:InputRequest@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/InterroleCommunication/InterroleCommunicationGroup/JobWorker:InputRequest" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>