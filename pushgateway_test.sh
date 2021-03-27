#!/bin/bash
echo "some_metric 3.14" | curl --data-binary @- http://localhost:9991/metrics/job/test_job
