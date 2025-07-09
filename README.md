# Pet-Grooming-Customer-Segmentation

This repository contains an R script that performs customer segmentation for a hypothetical pet grooming business. Using K-Means clustering, the project identifies distinct customer groups based on key behavioral metrics, providing insights for targeted marketing and service strategies.

## Table of Contents

- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Methodology](#methodology)
- [Key Features](#key-features)
- [Technologies Used](#technologies-used)
- [Setup and Usage](#setup-and-usage)
- [Results and Visualizations](#results-and-visualizations)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The main objective of this project is to categorize pet grooming customers into meaningful segments. By understanding different customer behaviors (e.g., how often they visit, how much they spend), businesses can tailor their services, promotions, and communication more effectively. This project demonstrates a complete workflow from data generation to cluster visualization and interpretation.

## Dataset

The project utilizes **artificially generated data** to simulate pet grooming customer records. Each record represents a unique pet and includes the following synthetic features:
- `pet_id`
- `pet_type` (e.g., Dog, Cat, Rabbit)
- `grooming_frequency_months`
- `avg_spend_per_visit`
- `total_visits`

## Methodology

1.  **Data Generation**: Artificial pet grooming data is created to simulate customer behavior.
2.  **Data Preparation**: Relevant variables (`grooming_frequency_months`, `avg_spend_per_visit`, `total_visits`) are selected and scaled to ensure equal contribution during clustering.
3.  **K-Means Clustering**: K-Means algorithm is applied to the scaled data to group customers into predefined `num_clusters` (set to 3 in this script).
4.  **Cluster Assignment**: Each pet record is assigned a cluster ID.
5.  **Visualization**:
    * A scatter plot visualizes the clusters based on `avg_spend_per_visit` and `total_visits`.
    * Bar charts are generated to summarize the mean characteristics (grooming frequency, average spend, total visits) for each cluster, aiding in interpretation.
6.  **Cluster Summary**: A detailed summary table is generated, showing the average values of the segmentation variables and the number of pets within each cluster.

## Key Features

-   Automated artificial data generation for reproducibility.
-   Data scaling for robust clustering.
-   Application of K-Means for customer segmentation.
-   Clear visualization of identified customer segments.
-   Quantitative summary of each cluster's characteristics.

## Technologies Used

-   R
-   `dplyr` (for data manipulation)
-   `tibble` (for data frame creation)
-   `ggplot2` (for data visualization)
-   `stats` (for K-Means clustering)

## Setup and Usage

To run this R script:

1.  **Install R**: If you don't have R installed, download it from the [CRAN website](https://cran.r-project.org/).
2.  **Install RStudio (Recommended)**: For a better development experience, download and install [RStudio Desktop](https://posit.co/download/rstudio-desktop/).
3.  **Clone the repository (or download the `MA-final.R` file):**

    ```bash
    git clone [https://github.com/YourUsername/Pet-Grooming-Customer-Segmentation.git](https://github.com/YourUsername/Pet-Grooming-Customer-Segmentation.git)
    cd Pet-Grooming-Customer-Segmentation
    ```

4.  **Open the script**: Open `MA-final.R` in RStudio.
5.  **Install Required Packages**: The script includes commands to install necessary packages. Run the following lines in your R console or directly from the script:

    ```R
    install.packages("dplyr")
    install.packages("tibble")
    install.packages("ggplot2")
    install.packages("stats")
    ```
6.  **Run the script**: Execute the entire script. In RStudio, you can do this by clicking the "Source" button or pressing `Ctrl+Shift+S` (Windows/Linux) / `Cmd+Shift+S` (macOS).

The script will output various plots and a cluster summary table in your RStudio Plots pane and Console, respectively.

## Results and Visualizations

Upon running the script, you will see:
-   A scatter plot showing customer segments based on `Average Spend Per Visit` and `Total Number of Visits`.
-   Bar charts illustrating the average `Grooming Frequency`, `Average Spend Per Visit`, and `Average Total Visits` for each identified customer segment.
-   A printed summary table of cluster characteristics in the console.

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.

## License

This project is open-source and available under the MIT License.
