import xml.etree.ElementTree as ET

def findint(element: ET.Element, path: str, default=None):
    value = element.find(path)
    if value is not None:
        return int(value.text)
    return default

def findfloat(element: ET.Element, path: str, default=None):
    value = element.find(path)
    if value is not None:
        return float(value.text)
    return default