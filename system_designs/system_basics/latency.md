### Latency is a time which our requests take. So, we use metrics for latency because we can't have capacity to fully understand the systems

### Percentiles

- Why Not Averages
Because averages are not real user experience or it can mislead. For example, we have few data points in milliseconds:
 `70, 100, 920, 850, 200`
 If we calculate average then it would be **428** which is not representative of your user experience
 
 - P50
 Its just a median. If we sort the data points above `70, 100, 200, 850, 920`. Then we get 200ms
 
 - P90
 To get P90, drop 90% of points and pick last one which is 920 in our example.
 
 - P99
 In some applications we may want to minimize tail latencies which correspond to worst user experience, Example:
 Lets in a web app data is stored in persisted DB but 90% requests are served from cache. Then p99 is determined by DB's latency
 
 - P99.9