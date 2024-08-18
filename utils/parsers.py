from pathlib import Path
from sys import argv
import xml.etree.ElementTree as ET
import json

def parse_impl_rpt(xml_rpt_path:Path):
    tree = ET.parse(xml_rpt_path)
    root = tree.getroot()
    ff = root.findall("AreaReport/Resources/FF")[0].text
    lut = root.findall("AreaReport/Resources/LUT")[0].text
    cp = root.findall("TimingReport/CP_FINAL")[0].text
    return ff, lut, cp
