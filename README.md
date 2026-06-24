# 32-Bit 5-Stage Pipelined Processor Using Verilog HDL

## Overview

This project presents the design, implementation, and verification of a **32-Bit 5-Stage Pipelined Processor** using **Verilog HDL**. The processor improves instruction throughput by dividing instruction execution into five stages and executing multiple instructions concurrently.

The design incorporates **pipeline registers**, **forwarding logic**, **hazard detection**, and **branch handling** mechanisms to ensure correct and efficient instruction execution while minimizing pipeline stalls.

The processor was developed and verified using **Xilinx Vivado Design Suite**.

---

## Key Features

* 32-Bit Processor Architecture
* 5-Stage Instruction Pipeline
* Verilog HDL Implementation
* Pipeline Registers (IF/ID, ID/EX, EX/MEM, MEM/WB)
* Forwarding Unit for Data Hazard Resolution
* Hazard Detection Unit for Stall Generation
* Branch Control and Branch Comparator
* Register File (32 Registers)
* Arithmetic Logic Unit (ALU)
* Instruction Memory
* Data Memory
* RTL Schematic Generation
* Behavioral Simulation and Verification
* Modular and Scalable Design

---

## Pipeline Architecture

The processor executes instructions through the following pipeline stages:

### Instruction Fetch (IF)

* Fetches instructions from Instruction Memory.
* Updates Program Counter (PC).
* Computes PC + 4.

### Instruction Decode (ID)

* Decodes instruction fields.
* Reads operands from Register File.
* Generates control signals.
* Performs immediate value generation.

### Execute (EX)

* Performs arithmetic and logical operations.
* Executes branch comparison.
* Implements forwarding logic.
* Generates ALU results.

### Memory Access (MEM)

* Executes memory read and write operations.
* Processes branch outcomes.

### Write Back (WB)

* Writes ALU or memory results back to the Register File.

---

## Processor Block Diagram

```text
        ┌──────────┐
        │   IF     │
        │ Fetch    │
        └────┬─────┘
             │
             ▼
        ┌──────────┐
        │   ID     │
        │ Decode   │
        └────┬─────┘
             │
             ▼
        ┌──────────┐
        │   EX     │
        │ Execute  │
        └────┬─────┘
             │
             ▼
        ┌──────────┐
        │   MEM    │
        │ Memory   │
        └────┬─────┘
             │
             ▼
        ┌──────────┐
        │   WB     │
        │WriteBack │
        └──────────┘

      ↑ Forwarding Unit
      ↑ Hazard Detection Unit
```

---

## Implemented Modules

### Core Processor Modules

* PC.v
* Instruction_Memory.v
* register_file.v
* control_unit.v
* ALU_Control.v
* aluu.v
* DataMemory.v

### Pipeline Registers

* IF_ID.v
* ID_EX.v
* EX_MEM.v
* MEM_WB.v

### Hazard Handling Modules

* ForwardingUnit.v
* Hazard_Detection.v

### Branch Handling Modules

* BranchControl.v
* Branch_Comparator.v

### Top-Level Module

* Pipeline_Processor.v

---

## Supported Instructions

### Arithmetic Instructions

* ADD
* SUB
* AND
* OR
* XOR

### Memory Instructions

* LOAD
* STORE

### Control Instructions

* Branch Operations

---

## Hazard Handling

### Forwarding Unit

The Forwarding Unit resolves data hazards by forwarding results directly from later pipeline stages to the Execute stage without waiting for write-back.

Benefits:

* Reduces pipeline stalls
* Improves throughput
* Maintains execution correctness

### Hazard Detection Unit

The Hazard Detection Unit identifies load-use hazards and inserts stalls when forwarding alone cannot resolve dependencies.

Functions:

* Detects data hazards
* Generates stall signals
* Controls pipeline execution

---

## Branch Handling

The processor includes:

* Branch Comparator
* Branch Control Logic

These modules ensure correct branch execution and maintain proper program flow within the pipeline.

---

## Project Structure

```text
32-bit-5-stage-pipelined-processor-verilog/
│
├── Source_Code/
│   ├── PC.v
│   ├── Instruction_Memory.v
│   ├── register_file.v
│   ├── control_unit.v
│   ├── ALU_Control.v
│   ├── aluu.v
│   ├── DataMemory.v
│   ├── IF_ID.v
│   ├── ID_EX.v
│   ├── EX_MEM.v
│   ├── MEM_WB.v
│   ├── ForwardingUnit.v
│   ├── Hazard_Detection.v
│   ├── BranchControl.v
│   ├── Branch_Comparator.v
│   └── Pipeline_Processor.v
│
├── Testbench/
│   └── Pipeline_Processor_tb.v
│
├── Architecture/
│   └── Pipeline_Architecture.png
│
├── RTL_Schematic/
│   └── RTL_Schematic.png
│
├── Simulation_Results/
│   ├── Pipeline_Waveform_1.png
│   ├── Pipeline_Waveform_2.png
│   ├── Pipeline_Waveform_3.png
│   ├── Forwarding_Unit_Result.png
│   └── Hazard_Detection_Result.png
│
└── README.md
```

---

## RTL Architecture

Insert RTL schematic generated from Vivado here:

```text
Architecture/RTL_Schematic.png
```

---

## Simulation Results

The processor was verified using behavioral simulation in Xilinx Vivado.

### Verification Includes

* Instruction Fetch
* Instruction Decode
* ALU Operations
* Register Read/Write
* Memory Read/Write
* Pipeline Register Operation
* Forwarding Logic
* Hazard Detection
* Branch Handling
* Complete Processor Execution

### Sample Waveforms

* Pipeline_Waveform_1.png
* Pipeline_Waveform_2.png
* Pipeline_Waveform_3.png

### Hazard Detection Verification

Demonstrates:

* Load-use hazard detection
* Stall generation
* Correct pipeline behavior

### Forwarding Verification

Demonstrates:

* EX-to-EX forwarding
* MEM-to-EX forwarding
* Reduced pipeline stalls

---

## How to Run

1. Open **Xilinx Vivado**.
2. Create a new Verilog project.
3. Add all files from **Source_Code/**.
4. Add testbench files from **Testbench/**.
5. Set **Pipeline_Processor_tb.v** as the top simulation module.
6. Run **Behavioral Simulation**.
7. Observe waveform outputs and verify processor functionality.

---

## Tools & Technologies

* Verilog HDL
* Xilinx Vivado Design Suite
* Vivado Simulator
* RTL Schematic Viewer
* Computer Architecture
* Digital Logic Design

---

## Learning Outcomes

Through this project, the following concepts were implemented and verified:

* Pipelined Processor Design
* Pipeline Register Implementation
* Data Hazard Resolution
* Forwarding Techniques
* Hazard Detection Mechanisms
* Branch Handling
* Instruction-Level Parallelism
* RTL Design Methodology
* Functional Verification
* Verilog HDL Development

---

## Future Enhancements

* Complete RISC-V ISA Support
* Branch Prediction Unit
* Cache Memory Integration
* Exception Handling
* Out-of-Order Execution
* Superscalar Architecture
* FPGA Deployment
* Performance Analysis Metrics

---

## Author

**Bellam Udaya Sree**
B.Tech – Electronics & Communication Engineering
JNTUA College of Engineering, Ananthapuramu

### Connect With Me

* GitHub: https://github.com/udayasree-vlsi
* LinkedIn: https://www.linkedin.com/in/udaya-sree-4b00a1304

---

## Project Status

✅ Completed
✅ Successfully Simulated
✅ RTL Generated
✅ Pipeline Verified
✅ Hazard Detection Verified
✅ Forwarding Verified
✅ Branch Handling Verified
✅ Uploaded to GitHub

### Next Project

🚀 **32-Bit 5-Stage Pipelined RISC-V Processor with Branch Prediction**
