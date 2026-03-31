# GPS L1 Signal Interference Analysis

## Overview
Statistical analysis and modeling of inter-satellite PRN code interference 
in GPS L1 signals using high-frequency observational data from the CHAIN 
network. This work identifies and characterizes anomalous signal patterns 
across 8,000+ hours of satellite data, distinguishing interference from 
noise using frequency-domain analysis and statistical thresholds.

## Research Question
Can inter-satellite PRN code interference be reliably identified and 
differentiated from ionospheric scintillation and multipath effects using 
frequency-domain analysis and statistical modeling?

## Dataset
- Source: CHAIN (Canadian High Arctic Ionospheric Network) receiver data
- Station: Churchill, Manitoba (58.75°N, 265.91°E)
- Sampling rate: 50–100 Hz high-frequency phase and amplitude data
- Coverage: 218+ interference events analyzed across 2015
- Data is openly available via the CHAIN network: chain.physics.unb.ca

## Methodology
- Applied 0.1 Hz high-pass Butterworth filter to remove refractive trends
- Used FFT on short time windows to extract dominant frequency signatures
- Detected interference events using statistical threshold: mean + 2σ 
  across matched PRN pairs within ±5 Hz Doppler-derived frequency range
- Calculated relative Doppler between satellite pairs to characterize 
  interference dynamics
- Validated a frequency-domain power model (Beach, 2007) against 
  observational data

## Key Findings
- Interference events lasted 1–3 minutes on average (mean: 3.5 min)
- LaserWelder events showed repeatable daily and sidereal patterns, 
  confirming geometry-driven interference rather than noise
- Traditional scintillation indices (S4, σφ) failed to distinguish 
  interference from multipath — frequency analysis was required
- Model validation showed strong agreement between observed and predicted 
  peak frequencies across 37 events

## Tools
- MATLAB (signal processing, FFT analysis, statistical modeling)
- Data: CHAIN network GNSS receivers (Septentrio PolarxS)

## Reproducibility Note
Scripts require CHAIN network raw data and proprietary reader functions 
(readGPSNew_Nancy). They are provided for methodological transparency. 
Processed outputs and results are documented in the published thesis.

## Published Thesis
Full methodology, results, and analysis available here:
[Statistical Analysis and Modeling of Inter-Satellite PRN Code Interference 
in GPS L1 Signals — Nancy Abraham, University of New Brunswick, 2025]
(https://unbscholar.lib.unb.ca/items/76a47581-3594-49d6-80b4-575369e86f46)

## Presentation
Defense presentation available in the `/presentation` folder.
