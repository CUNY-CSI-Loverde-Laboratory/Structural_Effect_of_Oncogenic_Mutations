"""
Location of data files
======================

Use as ::

    from Analysis_of_the_Nucleosome_System.data.files import *

"""

__all__ = [
    "MDANALYSIS_LOGO",  # example file of MDAnalysis logo
]

import importlib.resources

data_directory = importlib.resources.files("Analysis_of_the_Nucleosome_System") / "data"

MDANALYSIS_LOGO = data_directory / "mda.txt"
