from sys import argv

def read_obj_file(file_path):
    vertices = []
    faces = []
    with open(file_path, 'r') as f:
        for line in f:
            if line.startswith('v '):
                vertices.append(list(map(float, line.strip().split()[1:])))
            elif line.startswith('f '):
                faces.append(list(map(int, line.strip().split()[1:])))
    return vertices, faces

def downscale_obj(input_file_path, output_file_path):
    print(f"Preprocessing {input_file_path}...")
    vertices, faces = read_obj_file(input_file_path)

    # Round the coordinates of the vertices
    for vertex in vertices:
        for i in range(len(vertex)):
            vertex[i] = round(vertex[i] * 10e6)

    # Find smallest value from the vertices coordinates
    min_val = float('inf')
    for vertex in vertices:
        min_val = min(min_val, min(vertex))

    # Find largest value from the vertices coordinates
    max_val = float('-inf')
    for vertex in vertices:
        max_val = max(max_val, max(vertex))

    # Make the smallest value 0
    for vertex in vertices:
        for i in range(len(vertex)):
            vertex[i] -= min_val
    max_val -= min_val

    # Stretch the coordinates to [0, 255]
    for vertex in vertices:
        for i in range(len(vertex)):
            vertex[i] = round(255 * vertex[i] / max_val)

    # Remove duplicated faces
    '''
    valid_faces = []
    for face in faces:
        valid = True
        for valid_face in valid_faces:
            if vertices[face[0] - 1] == vertices[valid_face[0] - 1] \
                and vertices[face[1] - 1] == vertices[valid_face[1] - 1] \
                and vertices[face[2] - 1] == vertices[valid_face[2] - 1]:
                valid = False
                break
        if valid:
            valid_faces.append(face)
    '''

    # Remove faces with the same vertices
    face_vertices = [[vertices[face[0] - 1], vertices[face[1] - 1], vertices[face[2] - 1]] for face in faces]
    valid_face_vertices = []
    for face in face_vertices:
        valid = True
        for valid_face in valid_face_vertices:
            if face[0] == valid_face[0] and face[1] == valid_face[1] and face[2] == valid_face[2]:
                valid = False
                break
        if valid:
            valid_face_vertices.append(face)

    # Write the preprocessed triangles to the output file 
    # (in the format accepted by the 3D rendering benchmark)
    with open(output_file_path, 'w') as f:
        for face in valid_face_vertices:
            for vertex in face:
                f.write(f"{' '.join(list(map(str, vertex)))} ")
            f.write("\n")

if __name__ == '__main__':
    if len(argv) < 2 or len(argv) > 3:
        print("Usage: python preprocess_obj_file.py <obj_file_path> [<output_file_path>]")
        exit(1)

    input_file_path = argv[1]

    if len(argv) == 2:
        output_file_path = input_file_path.replace('.obj', '_preprocessed.txt')
    else:
        output_file_path = argv[2]

    downscale_obj(input_file_path, output_file_path)