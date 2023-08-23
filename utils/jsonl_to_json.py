import json
import requests


def parse_json():
    jsonl_url = "https://lj8a3h3g.api.sanity.io/v2021-06-07/data/export/production?types=podcast"
    response = requests.get(jsonl_url)
    response.raise_for_status()

    json_lines = response.text.strip().split("\n")
    json_list = []

    for line in json_lines:
        json_data = json.loads(line)
        json_list.append(json_data)

    json_output = {"data": json_list}

    output_file = "./utils/output.json"
    with open(output_file, "w") as f:
        json.dump(json_output, f, indent=2)


if __name__ == '__main__':
    parse_json()
