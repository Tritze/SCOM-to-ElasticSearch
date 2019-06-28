function Correct-DateTimeValue {
     param(
        [parameter(Mandatory=$true)]$input
     )
     if ($input -eq $null) {
        return ""
     } 
     else {
        return $input.ToString("u");
     }
}

function Create-ESBody {
     param(
        [parameter(Mandatory=$true)]$alert
     )

    $bodyObject = @{
        Name                              = $alert.Name;
        Description                       = $alert.Description;
        UnformattedDescription            = $alert.UnformattedDescription;
        MonitoringObjectId                = $alert.MonitoringObjectId;
        MonitoringClassId                 = $alert.MonitoringClassId;
        ClassId                           = $alert.ClassId;
        MonitoringObjectDisplayName       = $alert.MonitoringObjectDisplayName;
        MonitoringObjectName              = $alert.MonitoringObjectName;
        MonitoringObjectPath              = $alert.MonitoringObjectPath;
        MonitoringObjectFullName          = $alert.MonitoringObjectFullName;
        IsMonitorAlert                    = $alert.IsMonitorAlert;
        ProblemId                         = $alert.ProblemId;
        MonitoringRuleId                  = $alert.MonitoringRuleId;
        RuleId                            = $alert.RuleId;
        ResolutionState                   = $alert.ResolutionState;
        Priority                          = $alert.Priority;
        Severity                          = $alert.Severity;
        Category                          = $alert.Category;
        Owner                             = $alert.Owner;
        ResolvedBy                        = $alert.ResolvedBy;
        TimeRaised                        = $alert.TimeRaised;
        TimeAdded                         = $alert.TimeAdded;
        LastModified                      = $alert.LastModified;
        LastModifiedBy                    = $alert.LastModifiedBy;
        TimeResolved                      = $alert.TimeResolved;
        TimeResolutionStateLastModified   = $alert.TimeResolutionStateLastModified;
        CustomField1                      = $alert.CustomField1;
        CustomField2                      = $alert.CustomField2;
        CustomField3                      = $alert.CustomField3;
        CustomField4                      = $alert.CustomField4;
        CustomField5                      = $alert.CustomField5;
        CustomField6                      = $alert.CustomField6;
        CustomField7                      = $alert.CustomField7;
        CustomField8                      = $alert.CustomField8;
        CustomField9                      = $alert.CustomField9;
        CustomField10                     = $alert.CustomField10;
        TicketId                          = $alert.TicketId;
        Context                           = $alert.Context;
        ConnectorId                       = $alert.ConnectorId;
        LastModifiedByNonConnector        = $alert.LastModifiedByNonConnector;
        MonitoringObjectInMaintenanceMode = $alert.MonitoringObjectInMaintenanceMode;
        MonitoringObjectHealthState       = $alert.MonitoringObjectHealthState;
        ConnectorStatus                   = $alert.ConnectorStatus;
        RepeatCount                       = $alert.RepeatCount;
        NetbiosComputerName               = $alert.NetbiosComputerName;
        NetbiosDomainName                 = $alert.NetbiosDomainName;
        PrincipalName                     = $alert.PrincipalName;
        SiteName                          = $alert.SiteName;
        MaintenanceModeLastModified       = $alert.MaintenanceModeLastModified;
        StateLastModified                 = $alert.StateLastModified;
        Parameters                        = $alert.Parameters;
        TfsWorkItemId                     = $alert.TfsWorkItemId;
        TfsWorkItemOwner                  = $alert.TfsWorkItemOwner;
        #ManagementGroupName               = $alert.ManagementGroup;
        ManagementGroupId                 = $alert.ManagementGroupId;  
    }

    if ($alert.TimeRaised -ne $null) {
        $bodyObject.TimeRaised  = $alert.TimeRaised.ToString("s"); 
    }
    if ($alert.TimeAdded -ne $null) {
        $bodyObject.TimeAdded  = $alert.TimeAdded.ToString("s"); 
    }
    if ($alert.LastModified -ne $null) {
        $bodyObject.LastModified  = $alert.LastModified.ToString("s"); 
    }
    if ($alert.TimeResolved -ne $null) {
        $bodyObject.TimeResolved  = $alert.TimeResolved.ToString("s"); 
    }
    if ($alert.TimeResolutionStateLastModified -ne $null) {
        $bodyObject.TimeResolutionStateLastModified  = $alert.TimeResolutionStateLastModified.ToString("s"); 
    }
    if ($alert.LastModifiedByNonConnector -ne $null) {
        $bodyObject.LastModifiedByNonConnector  = $alert.LastModifiedByNonConnector.ToString("s"); 
    }
    if ($alert.MaintenanceModeLastModified -ne $null) {
        $bodyObject.MaintenanceModeLastModified  = $alert.MaintenanceModeLastModified.ToString("s"); 
    }
    if ($alert.StateLastModified -ne $null) {
        $bodyObject.StateLastModified  = $alert.StateLastModified.ToString("s"); 
    }

    return $bodyObject
}

function Send-ESDocument {
     param(
        [parameter(Mandatory=$false)]$protocol = "http",
        [parameter(Mandatory=$false)]$server = "elastic01",
        [parameter(Mandatory=$false)]$port = "9200",
        [parameter(Mandatory=$false)]$index = "scomespoc",
        [parameter(Mandatory=$false)]$type = "alert",
        [parameter(Mandatory=$true)]$document = "",
        [parameter(Mandatory=$true)]$body = ""
     )
    $method = "PUT"
    $uri = $protocol + "://" + $server + ":" + $port + "/" + $index + "/" + $type + "/" + $document

    $body = ConvertTo-Json $body

    Invoke-WebRequest -Uri $uri -Body $body -Method $method -ContentType application/json
}

Import-Module OperationsManager

$alerts = Get-SCOMAlert 

$alerts | foreach {
    $body = Create-ESBody -alert $_   
    Send-ESDocument -document $_.Id -body $body
}