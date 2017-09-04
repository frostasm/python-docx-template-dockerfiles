#!/usr/bin/env python3

import json
import argparse

from docxtpl import DocxTemplate


def parse_args():
    description="""Generate .docx document from docx template and json data file"""

    parser = argparse.ArgumentParser(description=description, formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('--template-file', type=str, required=True)
    parser.add_argument('--json-data-file', type=str, required=True)
    parser.add_argument('--generated-file', type=str, required=True)

    return parser.parse_args()


def main():
    args = parse_args()

    json_data = json.load(open(args.json_data_file))
    doc = DocxTemplate(args.template_file)
    doc.render(json_data)
    doc.save(args.generated_file)


if __name__ == "__main__":
    main()
