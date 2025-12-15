import pandas as pd
import numpy as np


def leer(path):
    df = pd.read_csv(path)
    return df
def x_y(df, target):
    X = df.drop(columns = [target])
    y = df [target]
    return X, y