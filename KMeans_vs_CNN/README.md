# A Comparison Between K-Means Clustering and Convolutional Neural Networks (CNN)

📅 **Project Year**: 2018  
👩🏽‍💻 **Author**: Keesha Orlène Ngombo Mouelet  
📚 **Supervisor**: Mr. B. Dutoit  

---

## Overview

This project presents a comparative analysis of two fundamental machine learning techniques—K-means clustering and Convolutional Neural Networks (CNN)—with a focus on their application in image recognition.

The aim was to explore the strengths and limitations of each method in tasks like classification and segmentation, using both generated and real-world image datasets.

---

## Background & Significance

As machine learning evolves, K-means clustering and CNN have become central to solving image-based classification and segmentation tasks. This project aims to:

- Provide a better understanding of how computers process and recognize visual data.
- Offer an open view into the mechanisms of segmentation and classification.
- Help identify optimal approaches to fit accurate prediction curves using data-driven methods.

---

## Research Objectives

- Understand how image recognition is applied in everyday life (e.g., commerce, healthcare, digital imaging).
- Explore what **K-means clustering** is and how to build the algorithm in MATLAB.
- Understand the structure and application of **Convolutional Neural Networks** (CNNs).
- Implement both models and evaluate their performance.
- Compare their effectiveness in terms of time, accuracy, and scalability.

---

## Methodology

- **Programming Language**: MATLAB  
- **Data**:
  - **K-means**: Simulated 2D data with 1000 observations, grouped into 10 clusters.
  - **CNN**: MNIST dataset used for supervised learning of handwritten digits.
- **Algorithmic Steps**:
  - **K-means**: Initialization → Cluster Assignment → Centroid Update
  - **CNN**: Input → Convolutional Layer → ReLU → Max Pooling → Fully Connected → Output

*Note*: Both algorithms were coded from scratch using MATLAB, including visualization, training loops, and performance checks.

---

## Results

- **K-Means Clustering**:
  - Data was segmented cleanly into 10 groups.
  - Effective for unsupervised grouping in low-dimensional space.
  - Limited when applied to high-dimensional or complex datasets.

- **CNN**:
  - Achieved a classification accuracy of 80% (16 correct out of 20 predictions).
  - Demonstrated strong predictive capability even with small training samples.
  - Effective for supervised image recognition tasks.

---

## Diagrams and Flowcharts

Visual aids used in the original presentation and report include:

-  **K-means Pipeline**:
  - Initialization (random centroids)
  - Cluster assignment via Euclidean distance
  - Updating centroids based on the mean

- **CNN Architecture**:
  - Input → Convolutional Layer → ReLU → Max Pooling → Fully Connected → Prediction
  - Gradient descent and backpropagation are used to optimize weights

> These diagrams can be found in the presentation slides or added to this repository in future updates.

---

## Key Differences

| Feature              | K-Means Clustering     | Convolutional Neural Networks |
|---------------------|------------------------|-------------------------------|
| Type of Learning    | Unsupervised           | Supervised                    |
| Application         | Grouping similar data  | Recognizing objects in images |
| Scalability         | Limited in >2D space   | Scales well with complexity   |
| Output              | Clustered regions      | Specific label prediction     |

---

## Conclusion

Both techniques have their merit, but for image classification:

- **CNN** is more accurate and adaptable.
- **K-means** is faster and simpler, but limited in prediction and scalability.

*Recommendation*: Further explore unsupervised learning techniques that can handle complex, high-dimensional image data with the accuracy and flexibility of CNNs.

---

## Files Included

- `KMeans_code.m` – MATLAB script for K-means clustering
- `CNN_code.m` – MATLAB script for CNN image classification
- `images`
---

## References

- Bishop, C. (2006). *Pattern Recognition and Machine Learning*  
- Towards Data Science (2018). *Applications of Deep Learning*  
- Deshpande (2016). *Understanding CNNs*  
- Edureka, Import.io, Remote Sensing, Machine Learning Mastery, and more.

---
