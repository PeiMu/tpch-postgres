import matplotlib.pyplot as plt
import numpy as np

# Data
queries = ['Q1', 'Q6']
wo_jit = [14.401, 1.845]
w_jit = [12.808, 1.515]
w_jit_de = [12.814, 1.528]

# Set up bar positions
x = np.arange(len(queries))
width = 0.25

# Create the plot
fig, ax = plt.subplots(figsize=(10, 6))

# Create bars
bars1 = ax.bar(x - width, wo_jit, width, label='w/o JIT', color='#e74c3c', alpha=0.8)
bars2 = ax.bar(x, w_jit, width, label='w/ JIT (threshold=0)', color='#3498db', alpha=0.8)
bars3 = ax.bar(x + width, w_jit_de, width, label='w/ JIT (default threshold)', color='#2ecc71', alpha=0.8)

# Add value labels on bars
def add_value_labels(bars):
    for bar in bars:
        height = bar.get_height()
        ax.text(bar.get_x() + bar.get_width()/2., height,
                f'{height:.2f}s',
                ha='center', va='bottom', fontsize=10)

add_value_labels(bars1)
add_value_labels(bars2)
add_value_labels(bars3)

# Customize the plot
ax.set_xlabel('Query Type', fontsize=12, fontweight='bold')
ax.set_ylabel('Execution Time (seconds)', fontsize=12, fontweight='bold')
ax.set_title('PostgreSQL JIT Performance Comparison', fontsize=14, fontweight='bold')
ax.set_xticks(x)
ax.set_xticklabels(queries, fontsize=12, fontweight='bold')
ax.legend(fontsize=10, loc='upper right')
ax.grid(axis='y', alpha=0.3, linestyle='--')

# Set y-axis to start from 0
ax.set_ylim(bottom=0)

# Add some padding to the top
ax.set_ylim(top=max(wo_jit) * 1.1)

plt.tight_layout()
plt.savefig('jit_performance_comparison.png', dpi=300, bbox_inches='tight')
plt.show()

print("Plot saved as 'jit_performance_comparison.png'")