#!/usr/bin/python

import pandas as pd

def hash_EL(filename):

    D = {}
    nodeset1 = set()
    nodeset2 = set()

    df = pd.read_csv(filename, header=None, sep=' ')
    df.columns = ['a','b']
    for i in df['a']:
        nodeset1.add(i)
    for i in df['b']:
        nodeset2.add(i)

    j = 1
    for i in sorted(nodeset1):
        D[i] = j
        j = j+1
    for i in list(nodeset2 - nodeset1):
        D[i] = j
        j = j+1

    df['a'] = df['a'].map(D)
    df['b'] = df['b'].map(D)
    result = df.sort_values(by=['a','b'],ascending=[1,1])
    result.to_csv(r'./bohs_twohcut_hashed_space.txt', header=None, index=None, sep=' ')

    return D, df

hash_EL('./bohs_34147_twoh_cut.txt')
