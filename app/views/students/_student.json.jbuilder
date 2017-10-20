json.extract! student, :id, :name, :last_name, :matricule_number, :blood_type, :allergy, :Parent_id, :Course_id, :created_at, :updated_at
json.url student_url(student, format: :json)
