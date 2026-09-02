"""Exploratory figure from the 2024 equipment-troubleshooting guide pilot."""

from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd


# The cleaning notebook wrote this file after removing the calibration trials.
PILOT_DATA = Path("/Volumes/lab-share/troubleshooting-guide-pilot/derived/diagnostic_responses.csv")
FIGURE_DIR = Path("/Volumes/lab-share/troubleshooting-guide-pilot/figures")


def plot_guide_comparison():
    """Compare the quick-reference and annotated guides across fault categories."""
    responses = pd.read_csv(PILOT_DATA)

    # I kept timeout rows here because running out of time is still a failed diagnostic attempt.
    # We should revisit this if we turn the pilot into a paper.
    summary = (
        responses.groupby(["fault_category", "guide_format"], as_index=False)
        .agg(
            accuracy=("diagnosis_correct", "mean"),
            mean_seconds=("diagnosis_seconds", "mean"),
            n=("technician_code", "size"),
        )
    )
    summary["accuracy_percent"] = 100 * summary["accuracy"]

    # This makes the guide comparison easy to scan, but assumes every category has both formats.
    accuracy = summary.pivot(index="fault_category", columns="guide_format", values="accuracy_percent")
    response_time = summary.pivot(index="fault_category", columns="guide_format", values="mean_seconds")

    fig, axes = plt.subplots(1, 2, figsize=(11, 4), sharex=True)
    accuracy[["quick_reference", "annotated_guide"]].plot.bar(
        ax=axes[0], color=["#777777", "#5B5EA6"]
    )
    axes[0].set(title="Diagnostic accuracy", ylabel="Percent correct", xlabel="")

    response_time[["quick_reference", "annotated_guide"]].plot.bar(
        ax=axes[1], color=["#777777", "#5B5EA6"]
    )
    axes[1].set(title="Diagnostic response time", ylabel="Mean seconds", xlabel="")

    # This was a lab-meeting graphic, so I did not add confidence intervals yet.
    fig.tight_layout()
    fig.savefig(FIGURE_DIR / "guide_comparison_by_fault_category.png", dpi=300)


if __name__ == "__main__":
    plot_guide_comparison()
