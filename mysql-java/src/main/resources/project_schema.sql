DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
project_id INT auto_increment NOT NULL,
project_name VARCHAR(128) NOT NULL,
estimated_hours decimal(7,2),
actual_hours decimal(7,2),
difficulty INT,
notes TEXT,
PRIMARY KEY (project_id)
);

CREATE TABLE category (
category_id INT auto_increment NOT NULL,
category_name VARCHAR(128) NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
project_id INT NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, category_id)
);

CREATE TABLE step (
step_id INT auto_increment NOT NULL,
project_id INT NOT NULL,
step_text TEXT NOT NULL,
step_order INT NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material (
material_id INT auto_increment NOT NULL,
project_id INT NOT NULL,
material_name VARCHAR(128) NOT NULL,
num_required INT,
cost decimal(7,2),
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Hang a door', 5.5, 5, 2, 'Dont hit your hand');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Door hangers', 5, 5.35);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Screws', 25, 1.35);
INSERT INTO step (project_id, step_text, step_order) VALUES(1, 'Rout the edge for the hanger', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES(1, 'Screw door to frame', 2);
INSERT INTO category (category_id, category_name) VALUES(1, 'Doors and Windows');
INSERT INTO category (category_id, category_name) VALUES(2, 'Repairs');
INSERT INTO category (category_id, category_name) VALUES(3, 'Gardening');
INSERT INTO project_category (project_id, category_id) VALUES(1, 1);
INSERT INTO project_category (project_id, category_id) VALUES(1, 2);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Make something', 5.5, 5, 2, 'Use tools');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Hammer', 1, 22.52);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Screws', 25, 1.35);
INSERT INTO step (project_id, step_text, step_order) VALUES(2, 'Take the hammer', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES(2, 'Hit the nail', 2);
INSERT INTO project_category (project_id, category_id) VALUES(2, 1);
INSERT INTO project_category (project_id, category_id) VALUES(2, 2);
