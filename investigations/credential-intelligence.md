
# Credential Intelligence Analysis

## 1. Objective

Analyze Cowrie SSH authentication logs to identify username patterns, password reuse, authentication outcomes, and login activity timelines.

## 2. Data Collection

Authentication events were extracted from:

`var/log/cowrie/cowrie.json`

The analysis used the following Cowrie event types:

- `cowrie.login.success`
- `cowrie.login.failed`

The analysis was performed using `jq` to filter, group, and summarize JSON log events.

## 3. Authentication Summary

A total of 8 authentication events were recorded.

| Metric | Count |
|---|---:|
| Successful logins | 5 |
| Failed logins | 3 |
| Total events | 8 |
| Distinct password values | 4 |

### Username Analysis

| Username | Successful | Failed |
|---|---:|---:|
| analyst | 4 | 1 |
| admin | 1 | 1 |
| attacker | 0 | 1 |

The analyst account recorded the highest number of successful logins.

## 4. Password Reuse Analysis

Password values were grouped without displaying the actual passwords.

| Group | Usernames | Attempts | Successful | Failed |
|---|---|---:|---:|---:|
| 1 | analyst | 4 | 4 | 0 |
| 2 | admin, analyst | 2 | 0 | 2 |
| 3 | admin | 1 | 1 | 0 |
| 4 | attacker | 1 | 0 | 1 |

### Key Observation

One password value was attempted against both the admin and analyst accounts. Both attempts failed.

This demonstrates a cross-account credential reuse pattern in the controlled test data.

Another password value was reused across four successful analyst logins.

## 5. Authentication Timeline

All 8 authentication events occurred on November 5, 2026 (UTC).

- An admin login succeeded at 09:11:10 UTC.
- A failed admin login followed approximately 32 seconds later.
- Three failed authentication events occurred within approximately seven minutes.
- Four successful analyst logins occurred later between 10:33:36 and 11:47:07 UTC.

## 6. Source IP Analysis

All authentication events originated from:

`127.0.0.1`

This is the localhost loopback address.

The results indicate that the recorded activity came from controlled local testing rather than external SSH connections.

## 7. Security Observations

- Repeated password use can make accounts vulnerable if credentials are exposed.
- Trying the same password against multiple usernames is a credential reuse pattern worth monitoring.
- Authentication success and failure events provide useful evidence for investigating login behaviour.
- Source IP analysis helps distinguish local testing from activity originating outside the host.

## 8. Limitations

- The current dataset contains only 8 authentication events.
- All events originated from localhost.
- The activity was generated through controlled testing.
- The results do not establish real-world attacker activity or a brute-force attack.
- Password values were intentionally excluded from this report.

## 9. Conclusion

This investigation demonstrated how Cowrie authentication logs can be used to examine login outcomes, username frequency, password reuse, and source IP addresses.

The analysis established a baseline for future credential intelligence investigations using the honeypot.
