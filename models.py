# Models are not strictly required; we use raw SQL via db helper.
# However, we define constants and mapping for clarity.

USER_ROLES = {
    1: 'Developer',
    2: 'Super Admin',
    3: 'Admin',
    # others as needed
}

# Helper to map table columns to Python dicts is handled by cursor(dictionary=True)