# python-docx-template-dockerfiles
 Dockerfiles for building images with LibreOffice and python-docx-template


Usage example

```bash
docker run -ti --rm --entrypoint /bin/bash -v path/to/data:/data frostasm/python-docx-template
cd /data
python3 -m docxtpl --template-file template.docx --json-data-file data.json --generated-file result.docx
soffice --convert-to pdf result.docx
```