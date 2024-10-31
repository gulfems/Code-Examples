import os
import pandas as pd

file_name = "aravindlikeaccuracy.xlsx"
path = os.path.join(os.path.expanduser("~"), "Desktop", file_name)

data = pd.read_excel(path)

data["object_total"] =data['o1'] + data['o2'] + data['o3'] + data['o4'] + data['o5'] + data['o6'] + data['o7'] + data['o8']
data["subject_total"] = data['s1'] + data['s2'] + data['s3'] + data['s4'] + data['s5'] + data['s6'] + data['s7'] + data['s8']
data["total_items"] = data['s1'] + data['s2'] + data['s3'] + data['s4'] + data['s5'] + data['s6'] + data['s7'] + data['s8'] + data['o1'] + data['o2'] + data['o3'] + data['o4'] + data['o5'] + data['o6'] + data['o7'] + data['o8']

# Veriyi gözden geçirin
print(data.head())

print(data["total_items"].mean())
print(data["total_items"].std())



import pandas as pd
import scipy.stats
from scipy.stats import kruskal

# Kruskal "cong"
statistic, p_value = kruskal(data[data['cong'] == 1]['total_items'],
                             data[data['cong'] == 2]['total_items'])

print("Kruskal-Wallis İstatistiği:", statistic)
print("p-değeri:", p_value)


# Kruskal "cond"
statistic, p_value = kruskal(data[data['cond'] == 'subject']['total_items'],
                             data[data['cond'] == 'object']['total_items'])

print("Kruskal-Wallis İstatistiği:", statistic)
print("p-değeri:", p_value)

means = data.groupby(['cond', 'cong'])['total_items'].mean()
print("Cond ve Cong'a Göre Total_Items Ortalamaları:")
print(means)

#ss
standart_sapmas = data.groupby(['cond','cong'])['total_items'].std()
print(standart_sapmas)

from scipy.stats import mannwhitneyu

# Subject ve object
for i in range(1, 9):
    subject_item = 's' + str(i)
    object_item = 'o' + str(i)

    from scipy.stats import kruskal

    from scipy.stats import kruskal

    stat, p_value = kruskal(data['subject_total'], data['object_total'])
    print("Kruskal-Wallis test statistics:", stat)
    print("p-value:", p_value)

import pandas as pd
from scipy.stats import kruskal

df = pd.DataFrame(data)

df['age'] = df['age'].astype(int)

groups = []
for age in [3, 4, 5, 6]:
    group = df[df['age'] == age]['total_items']
    groups.append(group)

stat, p_value = kruskal(*groups)
print("Kruskal-Wallis Test Statistic:", stat)
print("p-value:", p_value)

df = pd.DataFrame(data)

age_groups = df.groupby('age')['total_items']
for age, group in age_groups:
    mean = group.mean()
    std_dev = group.std()
    print(f"Yaş {age} için Ortalama: {mean:.2f}, Standart Sapma: {std_dev:.2f}")

age_groups = df.groupby('age')['subject_total']
for age, group in age_groups:
    mean = group.mean()
    std_dev = group.std()
    print(f"Yaş {age} için Ortalama: {mean:.2f}, Standart Sapma: {std_dev:.2f}")

age_groups = df.groupby('age')['object_total']
for age, group in age_groups:
    mean = group.mean()
    std_dev = group.std()
    print(f"Yaş {age} için Ortalama: {mean:.2f}, Standart Sapma: {std_dev:.2f}")

df = pd.DataFrame(data)

yas_ortalamalari = df.groupby('gen')['age'].mean()
yas_standart_sapmaları = df.groupby('gen')['age'].std()

print("Cinsiyete Göre Yaş Ortalamaları:")
print(yas_ortalamalari)
print("\nCinsiyete Göre Yaş Standart Sapmaları:")
print(yas_standart_sapmaları)

import pandas as pd
from statsmodels.formula.api import ols
from statsmodels.stats.anova import AnovaRM

#"just in case"
data = pd.read_excel("aravindaccuracy.xlsx")

model = ols('total_items ~ C(cond) * C(cong) * age', data=data).fit()

anova_table = AnovaRM(data, 'total_items', 'age', within=['cond', 'cong']).fit()

print(anova_table.anova_table)


