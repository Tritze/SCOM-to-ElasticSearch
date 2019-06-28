PUT /scomespoc
{
    "settings": {
        "index": {
            "number_of_shards": 3,
            "number_of_replicas": 2
        }
    },
    "mappings": {
        "alert": {
            "properties": {
                "Name": {
                    "type": "text"
                }, 
                "Description": {
                    "type": "text"
                },
                "UnformattedDescription": {
                    "type": "text"
                }, 
                "MonitoringObjectId": {
                    "type": "keyword"
                },
                "MonitoringClassId": {
                    "type": "keyword"
                },

                "ClassId": {
                    "type": "keyword"
                }, 
                "MonitoringObjectDisplayName": {
                    "type": "text"
                },
                "MonitoringObjectName": {
                    "type": "text"
                }, 
                "MonitoringObjectPath": {
                    "type": "text"
                },
                "MonitoringObjectFullName": {
                    "type": "text"
                },

                "IsMonitorAlert": {
                    "type": "boolean"
                }, 
                "ProblemId": {
                    "type": "keyword"
                },
                "MonitoringRuleId": {
                    "type": "keyword"
                }, 
                "RuleId": {
                    "type": "keyword"
                },
                "ResolutionState": {
                    "type": "short"
                },

                "Priority": {
                    "type": "keyword"
                }, 
                "Severity": {
                    "type": "keyword"
                },
                "Category": {
                    "type": "keyword"
                }, 
                "Owner": {
                    "type": "text"
                },
                "ResolvedBy": {
                    "type": "keyword"
                },

                "TimeRaised": {
                    "type": "date"
                }, 
                "TimeAdded": {
                    "type": "date"
                },
                "LastModified": {
                    "type": "date"
                }, 
                "LastModifiedBy": {
                    "type": "text"
                },
                "TimeResolved": {
                    "type": "date"
                },

                "TimeResolutionStateLastModified": {
                    "type": "date"
                }, 
                "CustomField1": {
                    "type": "text"
                },
                "CustomField2": {
                    "type": "text"
                }, 
                "CustomField3": {
                    "type": "text"
                },
                "CustomField4": {
                    "type": "text"
                },

                "CustomField5": {
                    "type": "text"
                }, 
                "CustomField6": {
                    "type": "text"
                },
                "CustomField7": {
                    "type": "text"
                }, 
                "CustomField8": {
                    "type": "text"
                },
                "CustomField9": {
                    "type": "text"
                },

                "CustomField10": {
                    "type": "text"
                }, 
                "TicketId": {
                    "type": "keyword"
                },
                "Context": {
                    "type": "text"
                }, 
                "ConnectorId": {
                    "type": "keyword"
                },
                "LastModifiedByNonConnector": {
                    "type": "date"
                },

                "MonitoringObjectInMaintenanceMode": {
                    "type": "boolean"
                }, 
                "MonitoringObjectHealthState": {
                    "type": "keyword"
                },
                "ConnectorStatus": {
                    "type": "keyword"
                }, 
                "RepeatCount": {
                    "type": "integer"
                },
                "NetbiosComputerName": {
                    "type": "keyword"
                },

                "NetbiosDomainName": {
                    "type": "keyword"
                }, 
                "PrincipalName": {
                    "type": "text"
                },
                "SiteName": {
                    "type": "text"
                }, 
                "MaintenanceModeLastModified": {
                    "type": "date"
                },
                "StateLastModified": {
                    "type": "date"
                },

                "Parameters": {
                    "type": "text"
                }, 
                "TfsWorkItemId": {
                    "type": "keyword"
                },
                "TfsWorkItemOwner": {
                    "type": "text"
                }, 
                "ManagementGroup": {
                    "type": "keyword"
                },
                "ManagementGroupId": {
                    "type": "keyword"
                }
            } 
        }
    } 
}