<?php

namespace App\Http\Requests\Dashboard;

use Illuminate\Foundation\Http\FormRequest;

class CreateMadingRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title' => 'required|string',
            'content' => 'required',
            'file' => 'required|file|image|mimes:jpeg,png,jpg'
        ];
    }

    public function messages()
    {
        return [
            "file.required" => "Thumbnail is required",
            "file.image" => "Thumbnail must be an image",
            "file.mimes" => "Thumbnail only accept .jpeg, .jpg, and .png extension"
        ];
    }
}
