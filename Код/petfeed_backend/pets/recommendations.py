# recommendations.py
from .models import Pet, Food
from .serializers import FoodSerializer
def recommend_food(pet):
    diseases_priority = {
        'Стерилизация': ['Белки', 'Жиры', 'Кальций', 'Фосфор', 'Витамин A', 'Витамин E', 'Железо'],
        'Беременность': ['Белки', 'Жиры', 'Кальций', 'Фосфор', 'Витамин A', 'Витамин D', 'Витамин E', 'Железо'],
        'Аллергии': ['Витамин E', 'Цинк', 'Селен'],
        'Болезни мочевыделительной системы': ['Витамин A', 'Витамин D', 'Кальций', 'Фосфор'],
        'Болезни почек': ['Витамин D', 'Кальций', 'Фосфор'],
        'Диабет': ['Витамин E', 'Цинк'],
        'Ожирение': ['Витамин D', 'Витамин E'],
        'Проблемы с кожей': ['Витамин A', 'Витамин E', 'Цинк', 'Селен'],
        'Проблемы с печенью': ['Витамин E'],
    }

    pet_diseases = pet.pet_diseases.split(';')
    required_nutrients = set()

    for disease in pet_diseases:
        if disease in diseases_priority:
            required_nutrients.update(diseases_priority[disease])

    foods = Food.objects.all()

    for nutrient in required_nutrients:
        foods = foods.filter(Q(nutrient_content__contains=nutrient))

    recommended_foods = FoodSerializer(foods, many=True).data

    return recommended_foods
