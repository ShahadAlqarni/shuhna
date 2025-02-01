import pandas as pd
import logging
from transformers import pipeline

# Load the CSV data
data_file = "sentiment_test_data.csv"  # Ensure this file is in the working directory
try:
    df = pd.read_csv(data_file)
except Exception as e:
    logging.error(f"Error loading CSV file: {e}")
    exit(1)

# Initialize the sentiment analysis pipeline using the CamelBert model
try:
    sentiment_analyzer = pipeline(
        "sentiment-analysis",
        model="CAMeL-Lab/bert-base-arabic-camelbert-da-sentiment"
    )
except Exception as e:
    logging.error(f"Error initializing the sentiment analyzer: {e}")
    exit(1)

# Function to evaluate the sentiment analyzer on the CSV dataset
def evaluate_sentiment(df):
    correct = 0
    total = len(df)
    detailed_results = []

    for index, row in df.iterrows():
        text = row["text"]
        expected = row["label"].strip().lower()

        try:
            # Run sentiment analysis on the text
            result = sentiment_analyzer(text)[0]
            # Adjust if your model uses different label names; here we assume "positive" and "negative"
            predicted = result["label"].strip().lower()
            score = result.get("score", 0)
        except Exception as e:
            logging.error(f"Error processing text: {text}\n{e}")
            predicted = "error"
            score = 0

        is_correct = predicted == expected
        if is_correct:
            correct += 1

        detailed_results.append({
            "text": text,
            "expected": expected,
            "predicted": predicted,
            "score": score,
            "correct": is_correct
        })

        print(f"Text: {text}")
        print(f"Expected: {expected}, Predicted: {predicted} (score: {score:.2f})")
        print(f"Correct: {is_correct}\n{'-'*50}")

    accuracy = correct / total if total > 0 else 0
    print(f"Overall Accuracy: {accuracy * 100:.2f}% ({correct}/{total} correct)")
    return detailed_results

if __name__ == "__main__":
    print("Starting sentiment evaluation...\n")
    results = evaluate_sentiment(df)
