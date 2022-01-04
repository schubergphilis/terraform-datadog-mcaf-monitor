# terraform-datadog-mcaf-monitor
A module for building Datadog monitors in Terraform


<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| datadog | >= 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| datadog | >= 3.3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dashboard | The Datadog dashboard URL shown in the alert message | `string` | `""` | no |
| evaluation\_delay | Seconds to delay evaluation to ensure the monitor has a full data period | `number` | `null` | no |
| include\_tags | Whether to insert the triggering tags into the monitoring title | `bool` | `true` | no |
| monitors | The set of monitor specific attributes per monitor | <pre>map(object({<br>    message    = string<br>    name       = string<br>    query      = string<br>    thresholds = map(string)<br>    threshold_windows = object({<br>      recovery_window = string<br>      trigger_window  = string<br>    })<br>    type = string<br>  }))</pre> | `null` | no |
| new\_group\_delay | Seconds after booting before starting the evaluation of monitor results | `number` | `null` | no |
| no\_data\_timeframe | The number of minutes before a monitor will notify when data stops reporting | `number` | `null` | no |
| notifiers | The notifiers to which the alerts get send | `list(string)` | `[]` | no |
| notify\_no\_data | Whether this monitor will notify when data stops reporting | `bool` | `true` | no |
| renotify\_interval | The number of minutes before a monitor will re-notify on the current status | `number` | `null` | no |
| require\_full\_window | A boolean indicating whether the monitor needs a full window of data before it's evaluated | `bool` | `true` | no |
| tag\_list | A list of tags to assign to the role | `list(string)` | `[]` | no |
| tag\_map | A map of tags to assign to the role | `map(string)` | `{}` | no |
| timeout | Hours of not reporting data before automatically resolving from a triggered state | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| monitor\_ids | A map with all monitor names and IDs |

<!--- END_TF_DOCS --->

## License

**Copyright:** Schuberg Philis

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
