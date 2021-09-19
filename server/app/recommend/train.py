from math import*
import decimal

def square_rooted(x):
    return round(sqrt(sum([a*a for a in x])), 3)

def cosine_similarity(x, y):
    numerator = sum(a*b for a, b in zip(x, y))
    denominator = square_rooted(x)*square_rooted(y)
    return round(decimal.Decimal(numerator)/decimal.Decimal(denominator), 5)

