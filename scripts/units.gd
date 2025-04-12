extends Node

const DISTANCE_TO_PIXELS := 100.0

# Convert game distance unit to pixels

func dist_to_px (dist: float) -> float:
	return dist * DISTANCE_TO_PIXELS

# Convert pixels back to game distance unit

func px_to_dist (pixels: float) -> float:
	return pixels / DISTANCE_TO_PIXELS