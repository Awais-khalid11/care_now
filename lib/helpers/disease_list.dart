class Disease {
  String precautions, symptoms, diseaseName;

  Disease({
    required this.precautions,
    required this.symptoms,
    required this.diseaseName,
  });
}

List<Disease> diseaseList = [
  Disease(
    diseaseName: "Fever",
    symptoms:
        "Elevated body temperature, often accompanied by chills, sweating, headache, muscle aches, fatigue, and dehydration",
    precautions:
        "Rest, stay hydrated with water, electrolyte-rich fluids, or oral rehydration solutions, use fever reducers like acetaminophen or ibuprofen as directed, monitor temperature regularly, seek medical attention if fever persists or worsens.",
  ),
  Disease(
    diseaseName: "Cold",
    symptoms:
        "Runny or stuffy nose, sore throat, cough, sneezing, mild fever, fatigue, body aches.",
    precautions:
        "Get plenty of rest, drink warm fluids like herbal tea or broth, use saline nasal sprays to relieve congestion, take over-the-counter cold medications for symptom relief, practice good hand hygiene to prevent spreading the virus.",
  ),
  Disease(
    diseaseName: "Influenza (Flu)",
    symptoms:
        "High fever, severe cough, sore throat, body aches, fatigue, headache, chills, sweating.",
    precautions:
        "Get vaccinated annually, rest, stay hydrated with water, electrolyte beverages, or soup, take antiviral medications if prescribed within the first 48 hours of symptom onset.",
  ),
  Disease(
    diseaseName: "Headache",
    symptoms:
        "Pain or discomfort in the head or neck region, sensitivity to light or sound, nausea.",
    precautions:
        "Identify and avoid triggers, manage stress through relaxation techniques, maintain regular sleep patterns, practice good posture, stay hydrated, consider over-the-counter pain relievers.",
  ),
  Disease(
    diseaseName: "Allergies",
    symptoms:
        "Sneezing, runny or stuffy nose, itchy or watery eyes, cough, wheezing, skin rash or hives.",
    precautions:
        "Identify and avoid allergens, use allergy medications (antihistamines, nasal corticosteroids) as directed, keep windows closed during high pollen seasons, use air purifiers, wash hands frequently.",
  ),
  Disease(
    diseaseName: "Migraine",
    symptoms:
        "Severe throbbing pain, usually on one side of the head, nausea, vomiting, sensitivity to light, sound, or smells, visual disturbances.",
    precautions:
        "Identify and avoid triggers, rest in a dark, quiet room, apply cold packs to the forehead, neck, or temples, take prescription migraine medications as directed.",
  ),
  Disease(
    diseaseName: "Asthma",
    symptoms:
        "Wheezing, shortness of breath, chest tightness, coughing, especially at night or early morning.",
    precautions:
        "Take asthma medications (inhaled corticosteroids, bronchodilators) as prescribed, avoid triggers (e.g., smoke, dust, pollen), maintain an asthma action plan, use peak flow meters to monitor lung function.",
  ),
  Disease(
    diseaseName: "Sinusitis",
    symptoms:
        "Facial pain, pressure, or tenderness, nasal congestion, postnasal drip, headache, loss of smell or taste.",
    precautions:
        "Use saline nasal irrigation or nasal sprays, apply warm compresses to the face, take over-the-counter decongestants or pain relievers, stay hydrated, avoid irritants like cigarette smoke.",
  ),
  Disease(
    diseaseName: "Stomach Flu (Gastroenteritis)",
    symptoms:
        "Nausea, vomiting, diarrhea, abdominal cramps, fever, headache, muscle aches.",
    precautions:
        "Stay hydrated with clear fluids, electrolyte beverages, or oral rehydration solutions, eat bland, easy-to-digest foods like bananas, rice, applesauce, and toast, avoid dairy, fatty, spicy foods, practice good hand hygiene to prevent spreading the virus.",
  ),
  Disease(
    diseaseName: "Urinary Tract Infection (UTI)",
    symptoms:
        "Pain or burning sensation during urination, frequent urination, cloudy or bloody urine, pelvic pain or pressure.",
    precautions:
        "Drink plenty of water, urinate frequently to flush out bacteria, avoid irritants like caffeine, alcohol, and spicy foods, take antibiotics as prescribed by a healthcare provider.",
  ),
  Disease(
    diseaseName: "Conjunctivitis (Pink Eye)",
    symptoms:
        "Redness, itching, tearing, discharge (clear, yellow, or green), crusting of eyelids or lashes.",
    precautions:
        "Wash hands frequently, avoid touching eyes, use cool compresses to soothe irritation, avoid sharing towels, pillows, or makeup, avoid wearing contact lenses until symptoms resolve.",
  ),
  Disease(
    diseaseName: "Sore Throat",
    symptoms:
        "Pain or irritation in the throat, difficulty swallowing, swollen glands in the neck.",
    precautions:
        "Gargle with warm salt water, drink warm fluids like tea with honey or broth, use throat lozenges or hard candies, avoid irritants like smoke, pollution, and dry air.",
  ),
  Disease(
    diseaseName: "Ear Infection",
    symptoms:
        "Ear pain, fluid drainage from the ear, hearing loss, fever, dizziness.",
    precautions:
        "Apply warm compresses to the affected ear, take over-the-counter pain relievers like acetaminophen or ibuprofen, avoid inserting objects into the ear canal, follow healthcare provider recommendations for treatment.",
  ),
  Disease(
    diseaseName: "Bronchitis",
    symptoms:
        "Persistent cough (with or without mucus), chest discomfort or tightness, shortness of breath, fatigue.",
    precautions:
        "Get plenty of rest, stay hydrated with water and warm fluids, use humidifiers to moisten the air, avoid smoke, pollutants, and other lung irritants, take over-the-counter cough suppressants or expectorants as directed.",
  ),
  Disease(
    diseaseName: "Pneumonia",
    symptoms:
        "High fever, cough (with or without mucus), shortness of breath, chest pain, fatigue, confusion (especially in older adults).",
    precautions:
        "Follow healthcare provider recommendations for treatment, get plenty of rest, stay hydrated with water, broth, or electrolyte beverages, use over-the-counter pain relievers and fever reducers as directed, avoid smoke, pollutants, and other lung irritants.",
  ),
  Disease(
    diseaseName: "Gastroesophageal Reflux Disease (GERD)",
    symptoms:
        "Heartburn, regurgitation, chest pain, difficulty swallowing, chronic cough.",
    precautions:
        "Avoid trigger foods (e.g., spicy, acidic, fatty), eat smaller, more frequent meals, avoid lying down after eating, elevate head while sleeping, maintain a healthy weight, avoid tight clothing around the abdomen, quit smoking.",
  ),
  Disease(
    diseaseName: "Hypertension (High Blood Pressure)",
    symptoms:
        "Often asymptomatic but can cause headaches, shortness of breath, dizziness, chest pain.",
    precautions:
        " Maintain a healthy weight, engage in regular physical activity, follow a balanced diet low in sodium, limit alcohol intake, manage stress, monitor blood pressure regularly, take prescribed medications as directed.",
  ),
  Disease(
    diseaseName: "Diabetes",
    symptoms:
        "Increased thirst, frequent urination, fatigue, blurred vision, slow healing wounds.",
    precautions:
        "Monitor blood sugar levels regularly, follow a balanced diet low in sugar and carbohydrates, engage in regular physical activity, take medications (insulin, oral hypoglycemic agents) as prescribed, maintain regular medical check-ups.",
  ),
  Disease(
    diseaseName: "Arthritis",
    symptoms:
        "Joint pain, stiffness, swelling, decreased range of motion, warmth or redness in the joints.",
    precautions:
        "Engage in regular low-impact exercises (e.g., swimming, cycling), maintain a healthy weight to reduce joint stress, use assistive devices (e.g., braces, splints), apply heat or cold therapy, take over-the-counter or prescription medications for pain and inflammation, consider physical therapy or occupational therapy.",
  ),
  Disease(
    diseaseName: "Insomnia",
    symptoms:
        "Difficulty falling asleep, staying asleep, or waking up too early, non-restorative sleep, daytime fatigue or sleepiness, irritability, difficulty concentrating.",
    precautions:
        "Establish a consistent sleep schedule, create a relaxing bedtime routine, ensure a comfortable sleep environment (e.g., dark, quiet, cool), limit caffeine and alcohol intake, avoid stimulating activities before bedtime, manage stress through relaxation techniques (e.g., meditation, deep breathing), consider cognitive-behavioral therapy for insomnia (CBT-I) or medications prescribed by a healthcare provider.",
  ),
  Disease(
    diseaseName: "Chronic Fatigue Syndrome (CFS)",
    symptoms: "Severe fatigue that is not relieved by rest,"
        " impaired memory or concentration (brain fog), "
        "unrefreshing sleep,"
        "muscle or joint pain,"
        "headaches, "
        "sore throat, "
        "tender lymph nodes.",
    precautions:
        "Pace activities to avoid overexertion, prioritize tasks and set realistic goals, practice good sleep hygiene, maintain a balanced diet, manage stress through relaxation techniques or counseling, consider cognitive-behavioral therapy (CBT) or graded exercise therapy (GET) under the guidance of a healthcare provider.",
  ),
];
