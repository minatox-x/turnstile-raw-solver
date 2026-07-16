import sys, json, urllib.parse

mode = sys.argv[1]
raw = sys.stdin.read().strip()

if mode == "encode":
    print(urllib.parse.quote(raw, safe=""))
elif mode == "task_id":
    d = json.loads(raw)
    print(d.get("taskId", "") or d.get("task_id", ""))
elif mode == "result":
    d = json.loads(raw)
    status = d.get("status", "")
    value = d.get("value") or (d.get("solution") or {}).get("token", "")
    print(f"{status}|{value}")
